
data "aws_iam_policy_document" "stackset_administration_role_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    effect  = "Allow"

    principals {
      identifiers = ["cloudformation.amazonaws.com"]
      type        = "Service"
    }
  }
}

data "aws_iam_policy_document" "stackset_administration_role_execution_policy" {
  statement {
    actions   = ["sts:AssumeRole"]
    effect    = "Allow"
    resources = ["arn:aws:iam::*:role/${local.stackset_name}-execution-role"]
  }
}

data "aws_iam_policy_document" "stackset_execution_role_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    effect  = "Allow"

    principals {
      identifiers = [module.stackset_administration_role.arn]
      type        = "AWS"
    }
  }
}

data "aws_iam_policy_document" "stackset_execution_role_example_policy" {
  #checkov:skip=CKV_AWS_356  "Ensure no IAM policies documents allow "*" as a statement's resource for restrictable actions"
  #checkov:skip=CKV_AWS_108 "Ensure IAM policies does not allow data exfiltration"
  #checkov:skip=CKV_AWS_109 "Ensure IAM policies does not allow permissions management / resource exposure without constraints"
  #checkov:skip=CKV_AWS_111 "Ensure IAM policies does not allow write access without constraints"
  #checkov:skip=CKV_AWS_107 "Ensure IAM policies does not allow credentials exposure"
  statement {
    actions = [
      "cloudformation:*",
      "s3:*",
      "sns:*",
      "ec2:*",
    ]

    effect    = "Allow"
    resources = ["*"]
  }
}
