locals {
  stackset_name = "complete-stackset-example"
  tags          = merge({ Name = local.stackset_name }, var.tags)
}
