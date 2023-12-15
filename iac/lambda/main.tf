resource "aws_lambda_function" "main" {
  function_name = var.jedi_lambda_function_name
  handler       = var.jedi_lambda_entrypoint
  runtime       = var.jedi_lambda_runtime
  role          = var.jedi_lambda_iam_role_arn

  filename         = var.jedi_lambda_zip_file
  source_code_hash = var.jedi_lambda_zip_file_md5

  environment {
    variables = {
      SECRET_NAME = var.secret_name
    }
  }

  # depends_on = [module.iam.jedi_log_group]
  depends_on = [var.jedi_log_group_arn]
}
