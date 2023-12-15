variable "region" {
  default = "eu-central-1"
}
variable "accountID" {
  description = "AWS accountID"
}
variable "kms_key_id" {
  description = "id of the KMS key used to decrypt the real Jedi id"
  default     = "e689f602-d180-4e5d-a57b-b13e40823d2a"
}
variable "kms_key_arn" {
  description = "arn of the KMS key used to decrypt the real Jedi id"
}
variable "lambda_source_dir" {
  description = "Path to directory that contains lambda function's code"
  default     = "../jedi-secrets/hello_world"
}
variable "path_to_output_zip" {
  description = "Where to put the archive with lambda's code"
  default     = "jedi-secrets.zip"
}
variable "jedi_secret_name" {
  description = "Name for the secret that holds the real Jedi id"
  default     = "jedi_id_3"
}
variable "jedi_lambda_log_sink_name" {
  description = "Name for the log group where lambda will report Jedi's data"
  default     = "/aws/lambda/jedi_lambda"
}
variable "event_bus_name" {
  description = "How to name the event bus"
  default     = "jedi-event-bus"
}
