
## cloudformation stack
resource "aws_cloudformation_stack" "main" {
  count              = var.stack_name != "" ? 1 : 0
  name               = var.stack_name
  template_body      = var.template_body
  template_url       = var.template_url
  capabilities       = var.capabilities
  disable_rollback   = var.disable_rollback
  notification_arns  = var.notification_arns
  on_failure         = var.disable_rollback == null ? var.on_failure : null
  parameters         = var.parameters
  policy_body        = var.policy_body
  policy_url         = var.policy_body == null ? var.policy_url : null
  tags               = var.tags
  iam_role_arn       = var.iam_role_arn
  timeout_in_minutes = var.timeout_in_minutes
  timeouts {
    create = lookup(var.timeouts, "create", "30m")
    update = lookup(var.timeouts, "update", "30m")
    delete = lookup(var.timeouts, "delete", "30m")
  }
}


## stack set
resource "aws_cloudformation_stack_set" "main" {
  count                   = var.stackset_name != "" ? 1 : 0
  administration_role_arn = var.stackset_administration_role_arn
  name                    = var.stackset_name
  parameters              = var.stackset_parameters
  template_body           = var.stackset_template_body
  capabilities            = var.stackset_capabilities
  description             = var.stackset_description
  execution_role_name     = var.stackset_execution_role_name
  permission_model        = var.stackset_permission_model
  call_as                 = var.stackset_call_as
  tags                    = var.tags
  template_url            = var.stackset_template_url
  timeouts {
    update = lookup(var.stackset_timeouts, "update", "30m")
  }

  lifecycle {
    create_before_destroy = true
  }
}


## stack set instance
resource "aws_cloudformation_stack_set_instance" "main" {
  count          = var.create_stack_set_instance ? 1 : 0
  stack_set_name = var.instance_stackset_name
  account_id     = var.account_id
  # Commented out deployment_targets since auto_deployment feature is required for SERVICE_MANAGED permission model.The feature will be added in subsequent releases.
  /*
  deployment_targets {
      organizational_unit_ids = var.organizational_unit_ids
  }
  */
  parameter_overrides = var.parameter_overrides
  region              = var.region
  retain_stack        = var.retain_stack
  timeouts {
    create = lookup(var.stackset_instance_timeouts, "create", "30m")
    update = lookup(var.stackset_instance_timeouts, "update", "30m")
    delete = lookup(var.stackset_instance_timeouts, "delete", "30m")
  }

}
