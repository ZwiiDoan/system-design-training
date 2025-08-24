
resource "aws_cloudwatch_event_bus" "transaction_bus" {
  name = "transaction-bus"
}

# EventBridge Rule to trigger the Step Function
resource "aws_cloudwatch_event_rule" "trigger_step_function" {
  name           = "trigger-step-function-rule"
  event_bus_name = aws_cloudwatch_event_bus.transaction_bus.name

  event_pattern = jsonencode({
    "source"      = ["com.my-app.transactions"],
    "detail-type" = ["transaction.submitted"]
  })
}

# EventBridge Target
resource "aws_cloudwatch_event_target" "step_function_target" {
  rule           = aws_cloudwatch_event_rule.trigger_step_function.name
  arn            = aws_sfn_state_machine.risk_scoring_workflow.id
  role_arn       = aws_iam_role.eventbridge_to_sfn_role.arn
  event_bus_name = aws_cloudwatch_event_bus.transaction_bus.name
}
