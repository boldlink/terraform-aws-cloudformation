[![Build Status](https://github.com/boldlink/terraform-aws-cloudformation/actions/workflows/pre-commit.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-cloudformation/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-cloudformation/actions/workflows/checkov.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-cloudformation/actions)

[<img src="https://avatars.githubusercontent.com/u/25388280?s=200&v=4" width="96"/>](https://boldlink.io)

# Terraform  module example of complete and most common configuration


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.11 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.20.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.32.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_stack_set"></a> [stack\_set](#module\_stack\_set) | ./../../ | n/a |
| <a name="module_stackset_administration_role"></a> [stackset\_administration\_role](#module\_stackset\_administration\_role) | boldlink/iam-role/aws | 1.1.0 |
| <a name="module_stackset_execution_role"></a> [stackset\_execution\_role](#module\_stackset\_execution\_role) | boldlink/iam-role/aws | 1.1.0 |
| <a name="module_stackset_instance"></a> [stackset\_instance](#module\_stackset\_instance) | ./../../ | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy_document.stackset_administration_role_assume_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.stackset_administration_role_execution_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.stackset_execution_role_assume_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.stackset_execution_role_example_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

No inputs.

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
