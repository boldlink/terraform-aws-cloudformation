# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]
- feat: showcase cloudformation type usage
- feat: optional stackset usage (external or in-module) in stackset instance resource
- fix: CKV_AWS_124 "Ensure that CloudFormation stacks are sending event notifications to an SNS topic"
- fix: CKV_TF_1 "Ensure Terraform module sources use a commit hash"
- fix: CKV_AWS_356  "Ensure no IAM policies documents allow "*" as a statement's resource for restrictable actions"
- fix: CKV_AWS_108 "Ensure IAM policies does not allow data exfiltration"
- fix: CKV_AWS_109 "Ensure IAM policies does not allow permissions management / resource exposure without constraints"
- fix: CKV_AWS_111 "Ensure IAM policies does not allow write access without constraints"
- fix: CKV_AWS_107 "Ensure IAM policies does not allow credentials exposure"

## [1.2.1] - 2023-08-16
- fix: added checkov exceptions to complete and minimum examples.

## [1.2.0] - 2022-09-26
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

[Unreleased]: https://github.com/boldlink/terraform-aws-cloudformation/compare/1.2.0...HEAD

[1.2.1]: https://github.com/boldlink/terraform-aws-cloudformation/releases/tag/1.2.1
[1.2.0]: https://github.com/boldlink/terraform-aws-cloudformation/releases/tag/1.2.0
[1.0.1]: https://github.com/boldlink/terraform-aws-cloudformation/releases/tag/1.0.1
[1.0.0]: https://github.com/boldlink/terraform-aws-cloudformation/releases/tag/1.0.0
