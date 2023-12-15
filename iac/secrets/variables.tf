variable "kms_key_id" {
  description = "id of the KMS key used to decrypt the real Jedi id"
}
variable "jedi_secret_name" {
  description = "Name for the secret that holds the real Jedi id"
}