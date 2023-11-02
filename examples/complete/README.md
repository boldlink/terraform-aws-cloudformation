[![License](https://img.shields.io/badge/License-Apache-blue.svg)](https://github.com/boldlink/terraform-aws-cloudformation/blob/main/LICENSE)
[![Latest Release](https://img.shields.io/github/release/boldlink/terraform-aws-cloudformation.svg)](https://github.com/boldlink/terraform-aws-cloudformation/releases/latest)
[![Build Status](https://github.com/boldlink/terraform-aws-cloudformation/actions/workflows/update.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-cloudformation/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-cloudformation/actions/workflows/release.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-cloudformation/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-cloudformation/actions/workflows/pre-commit.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-cloudformation/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-cloudformation/actions/workflows/pr-labeler.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-cloudformation/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-cloudformation/actions/workflows/module-examples-tests.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-cloudformation/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-cloudformation/actions/workflows/checkov.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-cloudformation/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-cloudformation/actions/workflows/auto-merge.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-cloudformation/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-cloudformation/actions/workflows/auto-badge.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-cloudformation/actions)

[<img src="https://avatars.githubusercontent.com/u/25388280?s=200&v=4" width="96"/>](https://boldlink.io)

# Terraform  module example of complete and most common configuration


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.11 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.20.0 |
| <a name="requirement_local"></a> [local](#requirement\_local) | >=2.4.0 |
| <a name="requirement_null"></a> [null](#requirement\_null) | >=3.2.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.23.1 |
| <a name="provider_local"></a> [local](#provider\_local) | 2.4.0 |
| <a name="provider_null"></a> [null](#provider\_null) | 3.2.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cloudformation_s3_bucket"></a> [cloudformation\_s3\_bucket](#module\_cloudformation\_s3\_bucket) | boldlink/s3/aws | 2.3.1 |
| <a name="module_sns_topic"></a> [sns\_topic](#module\_sns\_topic) | boldlink/sns/aws | 1.1.2 |
| <a name="module_stack"></a> [stack](#module\_stack) | ./../../ | n/a |
| <a name="module_stack_role"></a> [stack\_role](#module\_stack\_role) | boldlink/iam-role/aws | 1.1.1 |
| <a name="module_stack_set"></a> [stack\_set](#module\_stack\_set) | ./../../ | n/a |
| <a name="module_stack_with_s3"></a> [stack\_with\_s3](#module\_stack\_with\_s3) | ./../../ | n/a |
| <a name="module_stackset_administration_role"></a> [stackset\_administration\_role](#module\_stackset\_administration\_role) | boldlink/iam-role/aws | 1.1.0 |
| <a name="module_stackset_execution_role"></a> [stackset\_execution\_role](#module\_stackset\_execution\_role) | boldlink/iam-role/aws | 1.1.0 |
| <a name="module_stackset_instance"></a> [stackset\_instance](#module\_stackset\_instance) | ./../../ | n/a |

## Resources

| Name | Type |
|------|------|
| [null_resource.s3](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [aws_iam_policy_document.stack_assume_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.stackset_administration_role_assume_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.stackset_administration_role_execution_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.stackset_execution_role_assume_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.stackset_execution_role_example_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [local_file.json_file](https://registry.terraform.io/providers/hashicorp/local/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | Stack name. | `string` | `"Example-stack"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to the created resources | `map(string)` | <pre>{<br>  "Department": "DevOps",<br>  "Environment": "examples",<br>  "LayerId": "cExample",<br>  "LayerName": "cExample",<br>  "Owner": "Boldlink",<br>  "Project": "Examples",<br>  "user::CostCenter": "terraform-registry"<br>}</pre> | no |

## Outputs

No outputs.
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

#### BOLDLink-SIG 2022
