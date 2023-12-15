resource "aws_secretsmanager_secret" "jedi_secret" {
  name       = var.jedi_secret_name
  kms_key_id = var.kms_key_id
}
