# Step Function State Machine
resource "aws_sfn_state_machine" "risk_scoring_workflow" {
  name     = "risk-scoring-workflow"
  role_arn = aws_iam_role.step_function_role.arn

  definition = <<EOF
{
  "Comment": "A risk scoring workflow",
  "StartAt": "ReceiveTransaction",
  "States": {
    "ReceiveTransaction": {
      "Type": "Task",
      "Resource": "${aws_lambda_function.receive_transaction.arn}",
      "Next": "CheckAmount"
    },
    "CheckAmount": {
      "Type": "Task",
      "Resource": "${aws_lambda_function.check_amount.arn}",
      "Next": "IsHighRisk"
    },
    "IsHighRisk": {
      "Type": "Choice",
      "Choices": [
        {
          "Variable": "$.riskLevel",
          "StringEquals": "High Risk",
          "Next": "Notify"
        }
      ],
      "Default": "ScoreRisk"
    },
    "ScoreRisk": {
      "Type": "Task",
      "Resource": "${aws_lambda_function.score_risk.arn}",
      "Next": "Notify"
    },
    "Notify": {
      "Type": "Task",
      "Resource": "${aws_lambda_function.notify.arn}",
      "End": true
    }
  }
}
EOF
}