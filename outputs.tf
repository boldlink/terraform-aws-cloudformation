output "id" {
  value       = aws_cloudformation_stack.main.id
  description = "A unique identifier of the stack."
}

output "outputs" {
  value       = aws_cloudformation_stack.main.outputs
  description = "A map of outputs from the stack."
}

output "tags_all" {
  value       = aws_cloudformation_stack.main.tags_all
  description = "A map of tags assigned to the resource, including those inherited from the provider [`default_tags` configuration block](https://registry.terraform.io/docs/providers/aws/index#default_tags-configuration-block)."
}

/*
stack set
*/

output "stackset_arn" {
  value       = aws_cloudformation_stack_set.main.*.arn
  description = "Amazon Resource Name (ARN) of the StackSet."
}

output "stackset_id" {
  value       = aws_cloudformation_stack_set.main.*.id
  description = "Name of the StackSet."
}

output "stackset_stack_set_id" {
  value       = aws_cloudformation_stack_set.main.*.stack_set_id
  description = "Unique identifier of the StackSet."
}

output "stackset_tags_all" {
  value       = aws_cloudformation_stack_set.main.*.tags_all
  description = "A map of tags assigned to the resource, including those inherited from the provider [`default_tags` configuration block](https://registry.terraform.io/docs/providers/aws/index#default_tags-configuration-block)."
}

/*
stack set instance
*/

output "stackset_instance_id" {
  value       = aws_cloudformation_stack_set_instance.main.*.id
  description = "StackSet name, target AWS account ID, and target AWS region separated by commas (`,`)"
}

output "stackset_instance_organizational_unit_id" {
  value       = aws_cloudformation_stack_set_instance.main.*.organizational_unit_id
  description = "The organization root ID or organizational unit (OU) IDs specified for `deployment_targets`."
}

output "stackset_instance_stack_id" {
  value       = aws_cloudformation_stack_set_instance.main.*.stack_id
  description = "Stack identifier"
}

/*
cloudformation type
*/

output "cloudformation_type_arn" {
  value       = aws_cloudformation_type.main.*.arn
  description = "Optional) Amazon Resource Name (ARN) of the CloudFormation"
}

output "cloudformation_type_default_version_id" {
  value       = aws_cloudformation_type.main.*.default_version_id
  description = "Identifier of the CloudFormation Type default version."
}

output "cloudformation_type_deprecated_status" {
  value       = aws_cloudformation_type.main.*.deprecated_status
  description = "Deprecation status of the version."
}

output "cloudformation_type_description" {
  value       = aws_cloudformation_type.main.*.description
  description = "Description of the version."
}

output "cloudformation_type_documentation_url" {
  value       = aws_cloudformation_type.main.*.documentation_url
  description = "URL of the documentation for the CloudFormation Type."
}

output "cloudformation_type_is_default_version" {
  value       = aws_cloudformation_type.main.*.is_default_version
  description = "Whether the CloudFormation Type version is the default version."
}

output "cloudformation_type_provisioning_type" {
  value       = aws_cloudformation_type.main.*.provisioning_type
  description = "Provisioning behavior of the CloudFormation Type."
}

output "cloudformation_type_schema" {
  value       = aws_cloudformation_type.main.*.schema
  description = "JSON document of the CloudFormation Type schema."
}

output "cloudformation_type_source_url" {
  value       = aws_cloudformation_type.main.*.source_url
  description = "URL of the source code for the CloudFormation Type."
}

output "cloudformation_type_version_id" {
  value       = aws_cloudformation_type.main.*.version_id
  description = "(Optional) Identifier of the CloudFormation Type version."
}

output "cloudformation_type_visibility" {
  value       = aws_cloudformation_type.main.*.visibility
  description = "Scope of the CloudFormation Type."
}
