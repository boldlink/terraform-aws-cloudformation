
module "sns_topic" {
  source  = "boldlink/sns/aws"
  version = "1.1.2"
  name    = "${var.name}-sns"

  tags = merge({ Name = "${var.name}-sns" }, var.tags)
}

########################################################################
# Cloudformation stack with template body, policy body and iam_role_arn
########################################################################

module "stack_role" {
  source              = "boldlink/iam-role/aws"
  version             = "1.1.1"
  name                = "${var.name}-role"
  assume_role_policy  = data.aws_iam_policy_document.stack_assume_role_policy.json
  managed_policy_arns = ["arn:aws:iam::aws:policy/AmazonVPCFullAccess"]
  policies = {
    "${var.name}-policy" = {
      policy = data.aws_iam_policy_document.sns_topic.json
      tags   = var.tags
    }
  }
  force_detach_policies = true
  tags                  = merge({ Name = "${var.name}-role" }, var.tags)
}

module "stack" {
  source            = "./../../"
  stack_name        = var.name
  capabilities      = ["CAPABILITY_IAM"]
  on_failure        = "ROLLBACK"
  tags              = merge({ Name = var.name }, var.tags)
  iam_role_arn      = module.stack_role.arn
  notification_arns = [module.sns_topic.arn]
  parameters = {
    VPCCidr = "192.168.0.0/16"
    Name    = var.name
  }
  template_body      = templatefile("${path.module}/files/template.yml", {})
  policy_body        = data.local_file.json_file.content
  timeout_in_minutes = 30
  timeouts = {
    update = "30m"
    delete = "30m"
  }
  depends_on = [module.stack_role]
}

###############################################################################
# Cloudformation stack with template url and policy url stored in an s3 bucket
###############################################################################
resource "random_string" "bucket" {
  length  = 5
  special = false
  upper   = false
  numeric = false
}

module "cloudformation_s3_bucket" {
  source        = "boldlink/s3/aws"
  version       = "2.3.1"
  bucket        = lower("${var.name}-bucket-${random_string.bucket.result}")
  force_destroy = true
  tags          = merge({ Name = "${var.name}-bucket" }, var.tags)
}
resource "null_resource" "s3" {
  provisioner "local-exec" {
    command = "aws s3 sync ${path.module}/files s3://${module.cloudformation_s3_bucket.id}"
  }
  depends_on = [module.cloudformation_s3_bucket]
}

module "stack_with_s3" {
  source            = "./../../"
  stack_name        = "${var.name}-with-s3"
  notification_arns = [module.sns_topic.arn]
  parameters = {
    VPCCidr = "172.10.0.0/16"
    Name    = "${var.name}-with-s3"
  }
  tags         = merge({ Name = "${var.name}-with-s3" }, var.tags)
  template_url = "https://${module.cloudformation_s3_bucket.bucket_regional_domain_name}/template.yml"
  policy_url   = "https://${module.cloudformation_s3_bucket.bucket_regional_domain_name}/policy.json"

  depends_on = [module.cloudformation_s3_bucket, null_resource.s3]
}


##############
# Stack set
##############
module "stackset_administration_role" {
  source             = "boldlink/iam-role/aws"
  version            = "1.1.0"
  name               = "${var.name}set-administration-role"
  assume_role_policy = data.aws_iam_policy_document.stackset_administration_role_assume_role_policy.json
  policies = {
    "${var.name}set-administration-policy" = {
      policy = data.aws_iam_policy_document.stackset_administration_role_execution_policy.json
    }
  }
  tags = merge({ Name = "${var.name}set" }, var.tags)
}

module "stackset_execution_role" {
  source             = "boldlink/iam-role/aws"
  version            = "1.1.0"
  name               = "${var.name}set-execution-role"
  assume_role_policy = data.aws_iam_policy_document.stackset_execution_role_assume_role_policy.json
  policies = {
    "${var.name}set-execution-policy" = {
      policy = data.aws_iam_policy_document.stackset_execution_role_example_policy.json
    }
  }
  tags = merge({ Name = "${var.name}set" }, var.tags)
  depends_on = [
    module.stackset_administration_role
  ]
}

module "stack_set" {
  source                           = "./../../"
  stackset_administration_role_arn = module.stackset_administration_role.arn
  stackset_name                    = "${var.name}set"
  stackset_description             = "Example stackset"
  stackset_execution_role_name     = module.stackset_execution_role.name
  stackset_permission_model        = "SELF_MANAGED"
  stackset_call_as                 = "SELF"
  stackset_capabilities            = ["CAPABILITY_IAM"]
  notification_arns                = [module.sns_topic.arn]

  stackset_parameters = {
    VPCCidr = "172.0.0.0/16"
    Name    = "${var.name}set"

  }

  stackset_template_body = templatefile("${path.module}/files/template.yml", {})
  tags                   = merge({ Name = "${var.name}set" }, var.tags)

  stackset_timeouts = {
    update = "30m"
  }
  depends_on = [
    module.stackset_administration_role
  ]
}

## Stackset with s3
module "stack_set_with_s3" {
  source                           = "./../../"
  stackset_administration_role_arn = module.stackset_administration_role.arn
  stackset_name                    = "${var.name}set-with-s3"
  stackset_description             = "Example stackset with template in s3"
  stackset_execution_role_name     = "${var.name}set-execution-role"
  notification_arns                = [module.sns_topic.arn]

  stackset_parameters = {
    VPCCidr = "172.0.0.0/16"
    Name    = "${var.name}set-with-s3"
  }

  stackset_template_url = "https://${module.cloudformation_s3_bucket.bucket_regional_domain_name}/template.yml"
  tags                  = merge({ Name = "${var.name}set-with-s3" }, var.tags)
  depends_on            = [module.cloudformation_s3_bucket, null_resource.s3]
}

######################
# Stack set instance
######################
module "stackset_instance" {
  source                    = "./../../"
  region                    = data.aws_region.current.name
  notification_arns         = [module.sns_topic.arn]
  create_stack_set_instance = true
  instance_stackset_name    = module.stack_set.stackset_id[0]
  retain_stack              = false
  tags                      = merge({ Name = "${var.name}set-instance" }, var.tags)
  parameter_overrides = {
    VPCCidr = "172.20.0.0/16"
    Name    = "${var.name}set-instance"
  }
  stackset_instance_timeouts = {
    update = "10m"
    delete = "10m"
    create = "10m"
  }
}
