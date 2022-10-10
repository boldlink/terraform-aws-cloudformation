module "cloudformation_stack" {
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
