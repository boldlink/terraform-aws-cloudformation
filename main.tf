
## cloudformation stack
resource "aws_cloudformation_stack" "main" {
  count              = var.stack_name != "" ? 1 : 0
  name               = var.stack_name
  template_body      = var.template_body
  template_url       = var.template_url
  capabilities       = var.capabilities
  disable_rollback   = var.on_failure == null ? var.disable_rollback : null
  notification_arns  = var.notification_arns
  on_failure         = var.disable_rollback == null ? var.on_failure : null
  parameters         = var.parameters
  policy_body        = var.policy_url == null ? var.policy_body : null
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
  tags                    = var.stackset_tags
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
  count          = var.stackset_name != "" ? 1 : 0
  stack_set_name = var.stackset_instance_name
  account_id     = var.stackset_instance_account_id
  dynamic "deployment_targets" {
    for_each = var.stackset_instance_deployment_targets
    content {
      organizational_unit_ids = lookup(deployment_targets.value, "organizational_unit_ids", [])
    }
  }
  parameter_overrides = var.stackset_instance_parameter_overrides
  region              = var.stackset_instance_region
  retain_stack        = var.stackset_instance_retain_stack
  timeouts {
    create = lookup(var.stackset_instance_timeouts, "create", "30m")
    update = lookup(var.stackset_instance_timeouts, "update", "30m")
    delete = lookup(var.stackset_instance_timeouts, "delete", "30m")
  }

  lifecycle {
    create_before_destroy = true
  }
}


## cloudformation type
resource "aws_cloudformation_type" "main" {
  count                  = var.create_cloudformation_type ? 1 : 0
  schema_handler_package = var.cloudformation_type_schema_handler_package
  execution_role_arn     = var.cloudformation_type_execution_role_arn
  type                   = var.cloudformation_registry_type
  type_name              = var.cloudformation_type_name
  dynamic "logging_config" {
    for_each = var.cloudformation_type_logging_config
    content {
      log_group_name = logging_config.value.log_group_name
      log_role_arn   = logging_config.value.log_role_arn
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}
