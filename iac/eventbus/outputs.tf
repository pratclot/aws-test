
output "jedi_bus" {
  value = aws_cloudwatch_event_bus.main.arn
}

output "jedi_bus_name" {
  value = aws_cloudwatch_event_bus.main.name
}

output "trigger_name" {
  value = aws_cloudwatch_event_rule.main.name
}