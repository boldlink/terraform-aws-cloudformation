module "cloudformation_stack" {
  #checkov:skip=CKV_AWS_124: "Ensure that CloudFormation stacks are sending event notifications to an SNS topic"
  source        = "./../../"
  stack_name    = local.stack_name
  template_body = templatefile("template.yml", {})
  parameters = {
    VPCCidr = "172.0.0.0/16"
  }

  tags = {
    Name        = local.stack_name
    Environment = "examples"
  }
}
