# Stack set
module "stack_set" {
  source                           = "./../../"
  stackset_administration_role_arn = module.stackset_administration_role.arn
  stackset_name                    = local.stackset_name
  stackset_execution_role_name     = "${local.stackset_name}-execution-role"

  stackset_parameters = {
    VPCCidr = "172.0.0.0/16"
  }

  stackset_template_body = templatefile("template.yml", {})
  tags                   = local.tags
  depends_on = [
    module.stackset_administration_role
  ]
}

module "stackset_administration_role" {
  source             = "boldlink/iam-role/aws"
  version            = "1.1.0"
  name               = "${local.stackset_name}-administration-role"
  assume_role_policy = data.aws_iam_policy_document.stackset_administration_role_assume_role_policy.json
  policies = {
    "${local.stackset_name}-administration-policy" = {
      policy = data.aws_iam_policy_document.stackset_administration_role_execution_policy.json
    }
  }
}

# Stack set instance
module "stackset_instance" {
  source                    = "./../../"
  region                    = "eu-west-2"
  create_stack_set_instance = true
  instance_stackset_name    = module.stack_set.stackset_id[0]
}

module "stackset_execution_role" {
  source             = "boldlink/iam-role/aws"
  version            = "1.1.0"
  name               = "${local.stackset_name}-execution-role"
  assume_role_policy = data.aws_iam_policy_document.stackset_execution_role_assume_role_policy.json
  policies = {
    "${local.stackset_name}-execution-policy" = {
      policy = data.aws_iam_policy_document.stackset_execution_role_example_policy.json
    }
  }
  depends_on = [
    module.stackset_administration_role
  ]
}
