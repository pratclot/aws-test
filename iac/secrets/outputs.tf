
output "jedi_secret_arn" {
  value = aws_secretsmanager_secret.jedi_secret.arn
}

output "jedi_secret_name" {
  value = aws_secretsmanager_secret.jedi_secret.name
}
