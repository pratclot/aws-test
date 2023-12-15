
resource "aws_cloudwatch_event_bus" "main" {
  name = var.event_bus_name
}

resource "aws_lambda_permission" "main" {
  statement_id  = "InvokeLambdaFunction"
  action        = "lambda:InvokeFunction"
  function_name = var.jedi_lambda_function_name
  principal     = "events.amazonaws.com"

  source_arn = aws_cloudwatch_event_rule.main.arn
}

resource "aws_cloudwatch_event_target" "main" {
  rule           = aws_cloudwatch_event_rule.main.name
  arn            = var.jedi_lambda_function_arn
  event_bus_name = aws_cloudwatch_event_bus.main.name
  dead_letter_config {
    arn = aws_sqs_queue.main.arn
  }
}


resource "aws_sqs_queue" "main" {
  name = "jedi_dlq"
}

resource "aws_cloudwatch_event_rule" "main" {
  name           = "lambda_trigger_rule"
  description    = "Rule to trigger Lambda function"
  event_bus_name = aws_cloudwatch_event_bus.main.name
  event_pattern = jsonencode(
    {
      "source" : [
        var.pattern_for_event_source
      ],
      "detail-type" : [
        var.pattern_for_event_detail_type
      ]
    }
  )
}
