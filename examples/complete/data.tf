data "aws_region" "current" {}

data "local_file" "json_file" {
  filename = "${path.module}/files/policy.json"
}

data "aws_iam_policy_document" "sns_topic" {
  statement {
    actions = ["sns:Publish"]
    effect  = "Allow"
    resources = [module.sns_topic.arn]
  }
  
}

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

data "aws_iam_policy_document" "stack_assume_role_policy" {
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
    resources = ["arn:aws:iam::*:role/${var.name}set-execution-role"]
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
  #checkov:skip=CKV_AWS_111 "Ensure IAM policies does not allow write access without constraints"
  #checkov:skip=CKV_AWS_356  "Ensure no IAM policies documents allow "*" as a statement's resource for restrictable actions"
  statement {
    actions = [
      "cloudformation:CreateStack",
      "cloudformation:DeleteStack",
      "cloudformation:DescribeStacks",
      "cloudformation:DescribeStackEvents",
      "cloudformation:DescribeStackResource",
      "cloudformation:DescribeStackResources",
      "cloudformation:GetTemplate",
      "cloudformation:UpdateStack",
      "cloudformation:CreateChangeSet",
      "ec2:CreateVpc",
      "ec2:DeleteVpc",
      "ec2:DescribeVpcs",
      "ec2:AttachInternetGateway",
      "ec2:CreateInternetGateway",
      "ec2:DeleteInternetGateway",
      "ec2:DescribeInternetGateways",
      "ec2:CreateTags",
      "ec2:ModifyVpcAttribute"
    ]

    effect    = "Allow"
    resources = ["*"]
  }
}
