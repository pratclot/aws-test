variable "secret_name" {
  description = "Name of the secret that holds the Jedi id"
}

variable "jedi_secret_arn" {
  description = "arn of the secret that holds the Jedi id"
}

variable "jedi_lambda_function_name" {
  description = "Human-friendly name for the manifest processing lambda"
  default     = "jedi_lambda"
}

variable "jedi_lambda_entrypoint" {
  description = "Path to the symbol which will be invoked by the lambda machinery"
  default     = "app.lambda_handler"
}

variable "jedi_lambda_runtime" {
  description = "Lambda runtime spec"
  default     = "python3.9"
}

variable "jedi_lambda_iam_role_arn" {
  description = "arn of the role that will be used by the lambda"
}

variable "jedi_lambda_zip_file" {
  description = "Reference to the zip file which represents lambda deployment package"
}

variable "jedi_lambda_zip_file_md5" {
  description = "Hash of the zip"
}

variable "jedi_log_group_arn" {
  description = "arn of the log group that the lambda will use"
}
