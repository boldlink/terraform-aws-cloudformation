
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
