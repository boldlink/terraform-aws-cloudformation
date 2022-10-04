[![Build Status](https://github.com/boldlink/terraform-aws-cloudformation/actions/workflows/pre-commit.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-cloudformation/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-cloudformation/actions/workflows/checkov.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-cloudformation/actions)

[<img src="https://avatars.githubusercontent.com/u/25388280?s=200&v=4" width="96"/>](https://boldlink.io)

# AWS cloudformation Terraform module

## Description

This module creates a cloudformation stack, stack set, stack set instance and cloudformation type which in turn creates AWS resources.

Examples available [`here`](github.com/boldlink/terraform-aws-cloudformation/tree/main/examples)

## Usage
*NOTE*: These examples use the latest version of this module

* main.tf
```console
module "minimum" {
  source  = "boldlink/cloudformation/aws"
  version = "1.2.0"
  stack_name    = local.stack_name
  template_body = templatefile("template.yml", {})
  parameters = {
    VPCCidr = "172.0.0.0/16"
  }
  tags = {
    Name        = local.stack_name
    Environment = "examples"
  }
  ...
}
```

* locals.tf
```console
locals {
  stack_name = "minimum-cloudformation-stack"
}
```

* template.yml
```console
AWSTemplateFormatVersion: 2010-09-09
Metadata:
 'AWS::CloudFormation::Designer': {}
Resources:
  ExampleVPC:
    Type: 'AWS::EC2::VPC'
    Properties:
      CidrBlock: { "Ref" : "VPCCidr" }
      Tags: [
          {"Key": "Name", "Value": "example-stack-vpc"}, {"Key": "Environment", "Value": "examples"}
        ]
Parameters:
  VPCCidr:
    Type: String
    Default: '10.0.0.0/16'
    Description: 'CIDR block for the VPC.'
```

## Documentation

[AWS Cloudformation Documentation](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/Welcome.html)  

[Cloudformation Stack Terraform provider documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudformation_stack)  

[Cloudformation Stack Set Terraform provider documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudformation_stack_set)  

[Cloudformation Stack Set Instance Terraform provider documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudformation_stack_set_instance)  

[Cloudformation Type Terraform provider documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudformation_type)
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.11 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.20.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.31.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudformation_stack.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudformation_stack) | resource |
| [aws_cloudformation_stack_set.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudformation_stack_set) | resource |
| [aws_cloudformation_stack_set_instance.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudformation_stack_set_instance) | resource |
| [aws_cloudformation_type.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudformation_type) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_id"></a> [account\_id](#input\_account\_id) | (Optional) Target AWS Account ID to create a Stack based on the StackSet. Defaults to current account. | `string` | `null` | no |
| <a name="input_capabilities"></a> [capabilities](#input\_capabilities) | (Optional) A list of capabilities. Valid values: `CAPABILITY_IAM`, `CAPABILITY_NAMED_IAM`, or `CAPABILITY_AUTO_EXPAND` | `list(string)` | <pre>[<br>  "CAPABILITY_IAM"<br>]</pre> | no |
| <a name="input_cloudformation_registry_type"></a> [cloudformation\_registry\_type](#input\_cloudformation\_registry\_type) | (Optional) CloudFormation Registry Type. For example, `RESOURCE` or `MODULE`. | `string` | `null` | no |
| <a name="input_cloudformation_type_execution_role_arn"></a> [cloudformation\_type\_execution\_role\_arn](#input\_cloudformation\_type\_execution\_role\_arn) | (Optional) Amazon Resource Name (ARN) of the IAM Role for CloudFormation to assume when invoking the extension. If your extension calls AWS APIs in any of its handlers, you must create an IAM execution role that includes the necessary permissions to call those AWS APIs, and provision that execution role in your account. When CloudFormation needs to invoke the extension handler, CloudFormation assumes this execution role to create a temporary session token, which it then passes to the extension handler, thereby supplying your extension with the appropriate credentials. | `string` | `null` | no |
| <a name="input_cloudformation_type_logging_config"></a> [cloudformation\_type\_logging\_config](#input\_cloudformation\_type\_logging\_config) | (Optional) Configuration block containing logging configuration. | `map(string)` | `{}` | no |
| <a name="input_cloudformation_type_name"></a> [cloudformation\_type\_name](#input\_cloudformation\_type\_name) | (Optional) CloudFormation Type name. For example, `ExampleCompany::ExampleService::ExampleResource`. | `string` | `null` | no |
| <a name="input_cloudformation_type_schema_handler_package"></a> [cloudformation\_type\_schema\_handler\_package](#input\_cloudformation\_type\_schema\_handler\_package) | (Required) URL to the S3 bucket containing the extension project package that contains the necessary files for the extension you want to register. Must begin with `s3://` or `https://`. For example, s3://example-bucket/example-object. | `string` | `""` | no |
| <a name="input_create_cloudformation_type"></a> [create\_cloudformation\_type](#input\_create\_cloudformation\_type) | Choose whether to create this resource | `bool` | `false` | no |
| <a name="input_create_stack_set_instance"></a> [create\_stack\_set\_instance](#input\_create\_stack\_set\_instance) | Choose whether to create this resource | `bool` | `false` | no |
| <a name="input_disable_rollback"></a> [disable\_rollback](#input\_disable\_rollback) | (Optional) Set to true to disable rollback of the stack if stack creation failed. Conflicts with `on_failure`. | `string` | `null` | no |
| <a name="input_iam_role_arn"></a> [iam\_role\_arn](#input\_iam\_role\_arn) | (Optional) The ARN of an IAM role that AWS CloudFormation assumes to create the stack. If you don't specify a value, AWS CloudFormation uses the role that was previously associated with the stack. If no role is available, AWS CloudFormation uses a temporary session that is generated from your user credentials. | `string` | `null` | no |
| <a name="input_instance_stackset_name"></a> [instance\_stackset\_name](#input\_instance\_stackset\_name) | (Required) Name of the StackSet. | `string` | `""` | no |
| <a name="input_notification_arns"></a> [notification\_arns](#input\_notification\_arns) | (Optional) A list of SNS topic ARNs to publish stack related events. | `list(string)` | `[]` | no |
| <a name="input_on_failure"></a> [on\_failure](#input\_on\_failure) | (Optional) Action to be taken if stack creation fails. This must be one of: `DO_NOTHING`, `ROLLBACK`, or `DELETE`. Conflicts with `disable_rollback`. | `string` | `null` | no |
| <a name="input_parameter_overrides"></a> [parameter\_overrides](#input\_parameter\_overrides) | (Optional) Key-value map of input parameters to override from the StackSet for this Instance. | `map(string)` | `{}` | no |
| <a name="input_parameters"></a> [parameters](#input\_parameters) | (Optional) A map of Parameter structures that specify input parameters for the stack. | `map(string)` | `{}` | no |
| <a name="input_policy_body"></a> [policy\_body](#input\_policy\_body) | (Optional) Structure containing the stack policy body. Conflicts with policy\_url. | `string` | `null` | no |
| <a name="input_policy_url"></a> [policy\_url](#input\_policy\_url) | (Optional) Location of a file containing the stack policy. Conflicts with `policy_body`. | `string` | `null` | no |
| <a name="input_region"></a> [region](#input\_region) | (Optional) Target AWS Region to create a Stack based on the StackSet. Defaults to current region. | `string` | `null` | no |
| <a name="input_retain_stack"></a> [retain\_stack](#input\_retain\_stack) | (Optional) During Terraform resource destroy, remove Instance from StackSet while keeping the Stack and its associated resources. Must be enabled in Terraform state before destroy operation to take effect. You cannot reassociate a retained Stack or add an existing, saved Stack to a new StackSet. Defaults to `false`. | `bool` | `false` | no |
| <a name="input_stack_name"></a> [stack\_name](#input\_stack\_name) | (Required) Stack name. | `string` | `""` | no |
| <a name="input_stackset_administration_role_arn"></a> [stackset\_administration\_role\_arn](#input\_stackset\_administration\_role\_arn) | (Optional) Amazon Resource Number (ARN) of the IAM Role in the administrator account. This must be defined when using the SELF\_MANAGED permission model. | `string` | `""` | no |
| <a name="input_stackset_call_as"></a> [stackset\_call\_as](#input\_stackset\_call\_as) | (Optional) Specifies whether you are acting as an account administrator in the organization's management account or as a delegated administrator in a member account. Valid values: `SELF` (default), `DELEGATED_ADMIN`. | `string` | `"SELF"` | no |
| <a name="input_stackset_capabilities"></a> [stackset\_capabilities](#input\_stackset\_capabilities) | (Optional) A list of capabilities. Valid values: `CAPABILITY_IAM`, `CAPABILITY_NAMED_IAM`, `CAPABILITY_AUTO_EXPAND`. | `list(string)` | <pre>[<br>  "CAPABILITY_IAM"<br>]</pre> | no |
| <a name="input_stackset_description"></a> [stackset\_description](#input\_stackset\_description) | (Optional) Description of the StackSet. | `string` | `null` | no |
| <a name="input_stackset_execution_role_name"></a> [stackset\_execution\_role\_name](#input\_stackset\_execution\_role\_name) | (Optional) Name of the IAM Role in all target accounts for StackSet operations. Defaults to `AWSCloudFormationStackSetExecutionRole` when using the `SELF_MANAGED` permission model. This should not be defined when using the `SERVICE_MANAGED` permission model. | `string` | `null` | no |
| <a name="input_stackset_instance_deployment_targets"></a> [stackset\_instance\_deployment\_targets](#input\_stackset\_instance\_deployment\_targets) | (Optional) The AWS Organizations accounts to which StackSets deploys. StackSets doesn't deploy stack instances to the organization management account, even if the organization management account is in your organization or in an OU in your organization. Drift detection is not possible for this argument. | `list(string)` | `[]` | no |
| <a name="input_stackset_instance_timeouts"></a> [stackset\_instance\_timeouts](#input\_stackset\_instance\_timeouts) | Configuration options defining how long it takes the stack to be created, updated, and deleted | `map(string)` | `{}` | no |
| <a name="input_stackset_name"></a> [stackset\_name](#input\_stackset\_name) | (Required) Name of the StackSet. The name must be unique in the region where you create your StackSet. The name can contain only alphanumeric characters (case-sensitive) and hyphens. It must start with an alphabetic character and cannot be longer than 128 characters. | `string` | `""` | no |
| <a name="input_stackset_parameters"></a> [stackset\_parameters](#input\_stackset\_parameters) | (Optional) Key-value map of input parameters for the StackSet template. All template parameters, including those with a `Default`, must be configured or ignored with `lifecycle` configuration block `ignore_changes` argument. All `NoEcho` template parameters must be ignored with the `lifecycle` configuration block `ignore_changes` argument. | `map(string)` | `{}` | no |
| <a name="input_stackset_permission_model"></a> [stackset\_permission\_model](#input\_stackset\_permission\_model) | (Optional) Describes how the IAM roles required for your StackSet are created. Valid values: `SELF_MANAGED` (default), `SERVICE_MANAGED`. | `string` | `"SELF_MANAGED"` | no |
| <a name="input_stackset_tags"></a> [stackset\_tags](#input\_stackset\_tags) | (Optional) Key-value map of tags to associate with this StackSet and the Stacks created from it. AWS CloudFormation also propagates these tags to supported resources that are created in the Stacks. A maximum number of 50 tags can be specified. If configured with a provider [`default_tags` configuration block](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/docs#default_tags-configuration-block) present, tags with matching keys will overwrite those defined at the provider-level. | `map(string)` | `{}` | no |
| <a name="input_stackset_template_body"></a> [stackset\_template\_body](#input\_stackset\_template\_body) | (Optional) String containing the CloudFormation template body. Maximum size: 51,200 bytes. Conflicts with `template_url`. | `string` | `null` | no |
| <a name="input_stackset_template_url"></a> [stackset\_template\_url](#input\_stackset\_template\_url) | (Optional) String containing the location of a file containing the CloudFormation template body. The URL must point to a template that is located in an Amazon S3 bucket. Maximum location file size: 460,800 bytes. Conflicts with `template_body`. | `string` | `null` | no |
| <a name="input_stackset_timeouts"></a> [stackset\_timeouts](#input\_stackset\_timeouts) | Configuration block specifying how long to wait for a StackSet to be updated | `map(string)` | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) Map of resource tags to associate with this stack. If configured with a provider [`default_tags` configuration block](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/docs#default_tags-configuration-block) present, tags with matching keys will overwrite those defined at the provider-level. | `map(string)` | `{}` | no |
| <a name="input_template_body"></a> [template\_body](#input\_template\_body) | (Optional) Structure containing the template body (max size: 51,200 bytes). | `string` | `null` | no |
| <a name="input_template_url"></a> [template\_url](#input\_template\_url) | (Optional) Location of a file containing the template body (max size: 460,800 bytes). | `string` | `null` | no |
| <a name="input_timeout_in_minutes"></a> [timeout\_in\_minutes](#input\_timeout\_in\_minutes) | (Optional) The amount of time that can pass before the stack status becomes `CREATE_FAILED`. | `number` | `null` | no |
| <a name="input_timeouts"></a> [timeouts](#input\_timeouts) | configuration block for creating, modifying and destroying stacks | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloudformation_type_arn"></a> [cloudformation\_type\_arn](#output\_cloudformation\_type\_arn) | Optional) Amazon Resource Name (ARN) of the CloudFormation |
| <a name="output_cloudformation_type_default_version_id"></a> [cloudformation\_type\_default\_version\_id](#output\_cloudformation\_type\_default\_version\_id) | Identifier of the CloudFormation Type default version. |
| <a name="output_cloudformation_type_deprecated_status"></a> [cloudformation\_type\_deprecated\_status](#output\_cloudformation\_type\_deprecated\_status) | Deprecation status of the version. |
| <a name="output_cloudformation_type_description"></a> [cloudformation\_type\_description](#output\_cloudformation\_type\_description) | Description of the version. |
| <a name="output_cloudformation_type_documentation_url"></a> [cloudformation\_type\_documentation\_url](#output\_cloudformation\_type\_documentation\_url) | URL of the documentation for the CloudFormation Type. |
| <a name="output_cloudformation_type_is_default_version"></a> [cloudformation\_type\_is\_default\_version](#output\_cloudformation\_type\_is\_default\_version) | Whether the CloudFormation Type version is the default version. |
| <a name="output_cloudformation_type_provisioning_type"></a> [cloudformation\_type\_provisioning\_type](#output\_cloudformation\_type\_provisioning\_type) | Provisioning behavior of the CloudFormation Type. |
| <a name="output_cloudformation_type_schema"></a> [cloudformation\_type\_schema](#output\_cloudformation\_type\_schema) | JSON document of the CloudFormation Type schema. |
| <a name="output_cloudformation_type_source_url"></a> [cloudformation\_type\_source\_url](#output\_cloudformation\_type\_source\_url) | URL of the source code for the CloudFormation Type. |
| <a name="output_cloudformation_type_version_id"></a> [cloudformation\_type\_version\_id](#output\_cloudformation\_type\_version\_id) | (Optional) Identifier of the CloudFormation Type version. |
| <a name="output_cloudformation_type_visibility"></a> [cloudformation\_type\_visibility](#output\_cloudformation\_type\_visibility) | Scope of the CloudFormation Type. |
| <a name="output_id"></a> [id](#output\_id) | A unique identifier of the stack. |
| <a name="output_outputs"></a> [outputs](#output\_outputs) | A map of outputs from the stack. |
| <a name="output_stackset_arn"></a> [stackset\_arn](#output\_stackset\_arn) | Amazon Resource Name (ARN) of the StackSet. |
| <a name="output_stackset_id"></a> [stackset\_id](#output\_stackset\_id) | Name of the StackSet. |
| <a name="output_stackset_instance_id"></a> [stackset\_instance\_id](#output\_stackset\_instance\_id) | StackSet name, target AWS account ID, and target AWS region separated by commas (`,`) |
| <a name="output_stackset_instance_organizational_unit_id"></a> [stackset\_instance\_organizational\_unit\_id](#output\_stackset\_instance\_organizational\_unit\_id) | The organization root ID or organizational unit (OU) IDs specified for `deployment_targets`. |
| <a name="output_stackset_instance_stack_id"></a> [stackset\_instance\_stack\_id](#output\_stackset\_instance\_stack\_id) | Stack identifier |
| <a name="output_stackset_stack_set_id"></a> [stackset\_stack\_set\_id](#output\_stackset\_stack\_set\_id) | Unique identifier of the StackSet. |
| <a name="output_stackset_tags_all"></a> [stackset\_tags\_all](#output\_stackset\_tags\_all) | A map of tags assigned to the resource, including those inherited from the provider [`default_tags` configuration block](https://registry.terraform.io/docs/providers/aws/index#default_tags-configuration-block). |
| <a name="output_tags_all"></a> [tags\_all](#output\_tags\_all) | A map of tags assigned to the resource, including those inherited from the provider [`default_tags` configuration block](https://registry.terraform.io/docs/providers/aws/index#default_tags-configuration-block). |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Third party software
This repository uses third party software:
* [pre-commit](https://pre-commit.com/) - Used to help ensure code and documentation consistency
  * Install with `brew install pre-commit`
  * Manually use with `pre-commit run`
* [terraform 0.14.11](https://releases.hashicorp.com/terraform/0.14.11/) For backwards compatibility we are using version 0.14.11 for testing making this the min version tested and without issues with terraform-docs.
* [terraform-docs](https://github.com/segmentio/terraform-docs) - Used to generate the [Inputs](#Inputs) and [Outputs](#Outputs) sections
  * Install with `brew install terraform-docs`
  * Manually use via pre-commit
* [tflint](https://github.com/terraform-linters/tflint) - Used to lint the Terraform code
  * Install with `brew install tflint`
  * Manually use via pre-commit

### Supporting resources:

The example stacks are used by BOLDLink developers to validate the modules by building an actual stack on AWS.

Some of the modules have dependencies on other modules (ex. Ec2 instance depends on the VPC module) so we create them
first and use data sources on the examples to use the stacks.

Any supporting resources will be available on the `tests/supportingResources` and the lifecycle is managed by the `Makefile` targets.

Resources on the `tests/supportingResources` folder are not intended for demo or actual implementation purposes, and can be used for reference.

### Makefile
The makefile contain in this repo is optimized for linux paths and the main purpose is to execute testing for now.
* Create all tests stacks including any supporting resources:
```console
make tests
```
* Clean all tests *except* existing supporting resources:
```console
make clean
```
* Clean supporting resources - this is done separately so you can test your module build/modify/destroy independently.
```console
make cleansupporting
```
* !!!DANGER!!! Clean the state files from examples and test/supportingResources - use with CAUTION!!!
```console
make cleanstatefiles
```


#### BOLDLink-SIG 2022
