
resource "aws_cloudwatch_log_group" "jedi_lambda" {
  name              = var.jedi_lambda_log_sink_name
  retention_in_days = 30 # Optional: Set the retention period for log events
}
