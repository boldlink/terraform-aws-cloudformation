output "id" {
  value       = aws_cloudformation_stack.main.*.id
  description = "A unique identifier of the stack."
}

output "outputs" {
  value       = aws_cloudformation_stack.main.*.outputs
  description = "A map of outputs from the stack."
}

output "tags_all" {
  value       = aws_cloudformation_stack.main.*.tags_all
  description = "A map of tags assigned to the resource, including those inherited from the provider [`default_tags` configuration block](https://registry.terraform.io/docs/providers/aws/index#default_tags-configuration-block)."
}

## stack set
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


## stack set instance
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
