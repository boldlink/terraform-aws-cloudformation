# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]
- fix: CKV_AWS_124 "Ensure that CloudFormation stacks are sending event notifications to an SNS topic"
- fix: CKV_TF_1 "Ensure Terraform module sources use a commit hash"
- fix: CKV_AWS_356  "Ensure no IAM policies documents allow "*" as a statement's resource for restrictable actions"
- fix: CKV_AWS_111 "Ensure IAM policies does not allow write access without constraints"
- feat: stackset deployed to an organization unit

## [1.1.4] - 2024-01-29
- fix: "Ensure that CloudFormation stacks are sending event notifications to an SNS topic"

## [1.1.3] - 2023-11-06
- added cloudformation stack example
- added a Cloudformation stack with template url and policy url stored in an s3 bucket
- removed aws_cloudformation_type resource from the module
- Commented out deployment_targets since auto_deployment feature is required for SERVICE_MANAGED permission model.The feature will be added in subsequent releases.
- modified policy_body and disable_rollback conditions
- added a random string to example bucket name

## [1.1.2] - 2023-09-05
  - fix: CKV_AWS_109 "Ensure IAM policies does not allow permissions management / resource exposure without constraints"
  - fix: CKV_AWS_107 "Ensure IAM policies does not allow credentials exposure"
  - fix: CKV_AWS_108 "Ensure IAM policies does not allow data exfiltration"
  - fix: CHANGELOG release links

## [1.1.1] - 2023-08-16
- fix: added checkov exceptions to complete and minimum examples.

## [1.1.0] - 2022-09-26
### Description
- feat: Complete module example
- added: `CHANGELOG.md`, `SECURITY.md`, `PULL_REQUEST_TEMPLATE.md`, `Makefile`,`CODEOWNERS`, `versions.tf`
- updated: READMEs, `.gitignore`, github workflow files

## [1.0.1] - 2022-04-28
### Description
- fix: source in example

## [1.0.0] - 2022-03-18
### Description
- feat: initial module code
- feat: minimum example usage

[Unreleased]: https://github.com/boldlink/terraform-aws-cloudformation/compare/1.1.4...HEAD

[1.1.4]: https://github.com/boldlink/terraform-aws-cloudformation/releases/tag/1.1.4
[1.1.3]: https://github.com/boldlink/terraform-aws-cloudformation/releases/tag/1.1.3
[1.1.2]: https://github.com/boldlink/terraform-aws-cloudformation/releases/tag/1.1.2
[1.1.1]: https://github.com/boldlink/terraform-aws-cloudformation/releases/tag/1.1.1
[1.1.0]: https://github.com/boldlink/terraform-aws-cloudformation/releases/tag/1.1.0
[1.0.1]: https://github.com/boldlink/terraform-aws-cloudformation/releases/tag/1.0.1
[1.0.0]: https://github.com/boldlink/terraform-aws-cloudformation/releases/tag/1.0.0
