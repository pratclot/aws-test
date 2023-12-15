variable "jedi_secret_arn" {
  description = "arn of the secret that holds the Jedi id"
}

variable "jedi_log_group_name" {
  description = "arn of the log group the Jedi lambda will use"
}

variable "kms_key_arn" {
  description = "arn of the KMS key used to decrypt the real Jedi id"
}

variable "region" {
  description = "AWS region"
}

variable "accountID" {
  description = "AWS accountID"
}
