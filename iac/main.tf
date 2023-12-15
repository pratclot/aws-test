
module "secrets" {
  source = "./secrets"

  kms_key_id       = var.kms_key_id
  jedi_secret_name = var.jedi_secret_name
}

module "lambda" {
  source = "./lambda"

  secret_name     = var.jedi_secret_name
  jedi_secret_arn = module.secrets.jedi_secret_arn

  jedi_lambda_iam_role_arn = module.iam.jedi_lambda_iam_role_arn
  jedi_lambda_zip_file     = module.zipper.lambda_function_zip
  jedi_lambda_zip_file_md5 = module.zipper.lambda_function_zip_md5

  jedi_log_group_arn = module.logs.jedi_log_group_arn
}

module "logs" {
  source = "./logs"

  jedi_lambda_log_sink_name = var.jedi_lambda_log_sink_name
}

module "iam" {
  source = "./iam"

  jedi_secret_arn     = module.secrets.jedi_secret_arn
  jedi_log_group_name = module.logs.jedi_log_group_name
  kms_key_arn         = var.kms_key_arn
  region = var.region
  accountID = var.accountID
}

module "zipper" {
  source = "./zipper"

  lambda_source_dir  = var.lambda_source_dir
  path_to_output_zip = var.path_to_output_zip
}
module "eventbus" {
  source = "./eventbus"

  jedi_lambda_function_name = module.lambda.function_name
  jedi_lambda_function_arn  = module.lambda.arn
  event_bus_name            = var.event_bus_name
}
provider "aws" {
  region = var.region
}
