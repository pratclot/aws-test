
output "jedi_log_group_arn" {
  value = aws_cloudwatch_log_group.jedi_lambda.arn
}

output "jedi_log_group_name" {
  value = aws_cloudwatch_log_group.jedi_lambda.name
}