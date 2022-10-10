variable "stack_name" {
  type        = string
  description = "(Required) Stack name."
  default     = ""
}

variable "template_body" {
  type        = string
  description = "(Optional) Structure containing the template body (max size: 51,200 bytes)."
  default     = null
}

variable "template_url" {
  type        = string
  description = "(Optional) Location of a file containing the template body (max size: 460,800 bytes)."
  default     = null
}

variable "capabilities" {
  type        = list(string)
  description = "(Optional) A list of capabilities. Valid values: `CAPABILITY_IAM`, `CAPABILITY_NAMED_IAM`, or `CAPABILITY_AUTO_EXPAND`"
  default     = ["CAPABILITY_IAM"]
}

variable "disable_rollback" {
  type        = string
  description = "(Optional) Set to true to disable rollback of the stack if stack creation failed. Conflicts with `on_failure`."
  default     = null
}

variable "notification_arns" {
  type        = list(string)
  description = "(Optional) A list of SNS topic ARNs to publish stack related events."
  default     = []
}

variable "on_failure" {
  type        = string
  description = "(Optional) Action to be taken if stack creation fails. This must be one of: `DO_NOTHING`, `ROLLBACK`, or `DELETE`. Conflicts with `disable_rollback`."
  default     = null
}

variable "parameters" {
  type        = map(string)
  description = "(Optional) A map of Parameter structures that specify input parameters for the stack."
  default     = {}
}

variable "policy_body" {
  type        = string
  description = "(Optional) Structure containing the stack policy body. Conflicts with policy_url."
  default     = null
}

variable "policy_url" {
  type        = string
  description = "(Optional) Location of a file containing the stack policy. Conflicts with `policy_body`."
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "(Optional) Map of resource tags to associate with this stack. If configured with a provider [`default_tags` configuration block](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/docs#default_tags-configuration-block) present, tags with matching keys will overwrite those defined at the provider-level."
  default     = {}
}

variable "iam_role_arn" {
  type        = string
  description = "(Optional) The ARN of an IAM role that AWS CloudFormation assumes to create the stack. If you don't specify a value, AWS CloudFormation uses the role that was previously associated with the stack. If no role is available, AWS CloudFormation uses a temporary session that is generated from your user credentials."
  default     = null
}

variable "timeout_in_minutes" {
  type        = number
  description = "(Optional) The amount of time that can pass before the stack status becomes `CREATE_FAILED`."
  default     = null
}

variable "timeouts" {
  type        = map(string)
  description = "configuration block for creating, modifying and destroying stacks"
  default     = {}
}

## stack set
variable "stackset_administration_role_arn" {
  type        = string
  description = "(Optional) Amazon Resource Number (ARN) of the IAM Role in the administrator account. This must be defined when using the SELF_MANAGED permission model."
  default     = ""
}

variable "stackset_name" {
  type        = string
  description = "(Required) Name of the StackSet. The name must be unique in the region where you create your StackSet. The name can contain only alphanumeric characters (case-sensitive) and hyphens. It must start with an alphabetic character and cannot be longer than 128 characters."
  default     = ""
}

variable "stackset_capabilities" {
  type        = list(string)
  description = "(Optional) A list of capabilities. Valid values: `CAPABILITY_IAM`, `CAPABILITY_NAMED_IAM`, `CAPABILITY_AUTO_EXPAND`."
  default     = ["CAPABILITY_IAM"]
}

variable "stackset_description" {
  type        = string
  description = "(Optional) Description of the StackSet."
  default     = null
}

variable "stackset_execution_role_name" {
  type        = string
  description = "(Optional) Name of the IAM Role in all target accounts for StackSet operations. Defaults to `AWSCloudFormationStackSetExecutionRole` when using the `SELF_MANAGED` permission model. This should not be defined when using the `SERVICE_MANAGED` permission model."
  default     = null
}

variable "stackset_parameters" {
  type        = map(string)
  description = "(Optional) Key-value map of input parameters for the StackSet template. All template parameters, including those with a `Default`, must be configured or ignored with `lifecycle` configuration block `ignore_changes` argument. All `NoEcho` template parameters must be ignored with the `lifecycle` configuration block `ignore_changes` argument."
  default     = {}
}

variable "stackset_tags" {
  type        = map(string)
  description = "(Optional) Key-value map of tags to associate with this StackSet and the Stacks created from it. AWS CloudFormation also propagates these tags to supported resources that are created in the Stacks. A maximum number of 50 tags can be specified. If configured with a provider [`default_tags` configuration block](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/docs#default_tags-configuration-block) present, tags with matching keys will overwrite those defined at the provider-level."
  default     = {}
}

variable "stackset_template_body" {
  type        = string
  description = "(Optional) String containing the CloudFormation template body. Maximum size: 51,200 bytes. Conflicts with `template_url`."
  default     = null
}

variable "stackset_template_url" {
  type        = string
  description = "(Optional) String containing the location of a file containing the CloudFormation template body. The URL must point to a template that is located in an Amazon S3 bucket. Maximum location file size: 460,800 bytes. Conflicts with `template_body`."
  default     = null
}

variable "stackset_timeouts" {
  type        = map(string)
  description = "Configuration block specifying how long to wait for a StackSet to be updated"
  default     = {}
}

variable "stackset_permission_model" {
  type        = string
  description = "(Optional) Describes how the IAM roles required for your StackSet are created. Valid values: `SELF_MANAGED` (default), `SERVICE_MANAGED`."
  default     = "SELF_MANAGED"
}

variable "stackset_call_as" {
  type        = string
  description = "(Optional) Specifies whether you are acting as an account administrator in the organization's management account or as a delegated administrator in a member account. Valid values: `SELF` (default), `DELEGATED_ADMIN`."
  default     = "SELF"
}


## stack set instance
variable "create_stack_set_instance" {
  type        = bool
  description = "Choose whether to create this resource"
  default     = false
}

variable "instance_stackset_name" {
  type        = string
  description = "(Required) Name of the StackSet."
  default     = ""
}

variable "account_id" {
  type        = string
  description = "(Optional) Target AWS Account ID to create a Stack based on the StackSet. Defaults to current account."
  default     = null
}

variable "stackset_instance_deployment_targets" {
  type        = list(string)
  description = "(Optional) The AWS Organizations accounts to which StackSets deploys. StackSets doesn't deploy stack instances to the organization management account, even if the organization management account is in your organization or in an OU in your organization. Drift detection is not possible for this argument."
  default     = []
}

variable "parameter_overrides" {
  type        = map(string)
  description = "(Optional) Key-value map of input parameters to override from the StackSet for this Instance."
  default     = {}
}

variable "region" {
  type        = string
  description = "(Optional) Target AWS Region to create a Stack based on the StackSet. Defaults to current region."
  default     = null
}

variable "retain_stack" {
  type        = bool
  description = "(Optional) During Terraform resource destroy, remove Instance from StackSet while keeping the Stack and its associated resources. Must be enabled in Terraform state before destroy operation to take effect. You cannot reassociate a retained Stack or add an existing, saved Stack to a new StackSet. Defaults to `false`."
  default     = false
}

variable "stackset_instance_timeouts" {
  type        = map(string)
  description = "Configuration options defining how long it takes the stack to be created, updated, and deleted"
  default     = {}
}


## cloudformation type
variable "cloudformation_type_execution_role_arn" {
  type        = string
  description = "(Optional) Amazon Resource Name (ARN) of the IAM Role for CloudFormation to assume when invoking the extension. If your extension calls AWS APIs in any of its handlers, you must create an IAM execution role that includes the necessary permissions to call those AWS APIs, and provision that execution role in your account. When CloudFormation needs to invoke the extension handler, CloudFormation assumes this execution role to create a temporary session token, which it then passes to the extension handler, thereby supplying your extension with the appropriate credentials."
  default     = null
}

variable "cloudformation_type_logging_config" {
  type        = map(string)
  description = "(Optional) Configuration block containing logging configuration."
  default     = {}
}

variable "cloudformation_type_schema_handler_package" {
  type        = string
  description = "(Required) URL to the S3 bucket containing the extension project package that contains the necessary files for the extension you want to register. Must begin with `s3://` or `https://`. For example, s3://example-bucket/example-object."
  default     = ""
}

variable "cloudformation_registry_type" {
  type        = string
  description = "(Optional) CloudFormation Registry Type. For example, `RESOURCE` or `MODULE`."
  default     = null
}

variable "cloudformation_type_name" {
  type        = string
  description = "(Optional) CloudFormation Type name. For example, `ExampleCompany::ExampleService::ExampleResource`."
  default     = null
}

variable "create_cloudformation_type" {
  type        = bool
  description = "Choose whether to create this resource"
  default     = false
}
