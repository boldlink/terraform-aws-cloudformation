  locals {
    role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid      = "AllowSNSPublish"
        Action   = ["sns:Publish"]
        Effect   = "Allow"
        Resource = "${module.sns_topic.arn}"
      },
    ]
  })
  }

