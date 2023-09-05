locals {
  stack_name = "minimum-cloudformation-stack"
  tags       = merge({ Name = local.stack_name }, var.tags)
}
