locals {
  stackset_name = "complete-stackset-example"
  tags = {
    name        = local.stackset_name
    Environment = "examples"
  }
}
