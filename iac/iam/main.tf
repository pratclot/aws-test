
data "aws_iam_policy_document" "main" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}
resource "aws_iam_role" "main" {
  name               = "iam_role_for_jedi_lambda"
  assume_role_policy = data.aws_iam_policy_document.main.json
}

resource "aws_iam_policy" "main" {
  name        = "jedi_lambda_policy"
  description = "Policy to allow Lambda function to write to CloudWatch Logs and interact with KMS and Secrets Manager"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "logs:CreateLogStream",
          "logs:PutLogEvents",
        ],
        Effect = "Allow",
        # from https://stackoverflow.com/a/37383297/13442292
        Resource = "arn:aws:logs:${var.region}:${var.accountID}:log-group:${var.jedi_log_group_name}:*"
      },
      {
        Action = [
          "secretsmanager:GetSecretValue"
        ],
        Effect   = "Allow",
        Resource = var.jedi_secret_arn,
      },
      {
        Action = [
          "kms:DescribeKey",
          "kms:GetKeyPolicy",
          "kms:ListKeys",
          "kms:Decrypt"
        ],
        Effect   = "Allow",
        Resource = var.kms_key_arn
      },
    ],
  })
}

resource "aws_iam_role_policy_attachment" "main" {
  policy_arn = aws_iam_policy.main.arn
  role       = aws_iam_role.main.name
}
