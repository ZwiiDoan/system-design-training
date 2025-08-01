
# IAM Role for the Step Function
resource "aws_iam_role" "step_function_role" {
  name = "step-function-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "states.amazonaws.com"
        }
      }
    ]
  })
}

# IAM Policy for the Step Function
resource "aws_iam_policy" "step_function_policy" {
  name        = "step-function-policy"
  description = "Policy for the Step Function to invoke Lambda functions"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = "lambda:InvokeFunction"
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}

# Attach Policy to Role
resource "aws_iam_role_policy_attachment" "step_function_policy_attachment" {
  role       = aws_iam_role.step_function_role.name
  policy_arn = aws_iam_policy.step_function_policy.arn
}

# IAM Role for the Lambda Functions
resource "aws_iam_role" "lambda_role" {
  name = "lambda-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

# IAM Policy for the Lambda Functions
resource "aws_iam_policy" "lambda_policy" {
  name        = "lambda-policy"
  description = "Policy for the Lambda functions to write to CloudWatch Logs, SES, and EventBridge"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
        Effect   = "Allow"
        Resource = "arn:aws:logs:*:*:*"
      },
      {
        Action   = "ses:SendEmail"
        Effect   = "Allow"
        Resource = "*"
      },
      {
        Action   = "events:PutEvents"
        Effect   = "Allow"
        Resource = aws_cloudwatch_event_bus.transaction_bus.arn
      }
    ]
  })
}

# Attach Policy to Role
resource "aws_iam_role_policy_attachment" "lambda_policy_attachment" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.lambda_policy.arn
}

# IAM Role for EventBridge to trigger Step Functions
resource "aws_iam_role" "eventbridge_to_sfn_role" {
  name = "eventbridge-to-sfn-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "events.amazonaws.com"
        }
      }
    ]
  })
}

# IAM Policy for EventBridge to trigger Step Functions
resource "aws_iam_policy" "eventbridge_to_sfn_policy" {
  name        = "eventbridge-to-sfn-policy"
  description = "Policy for EventBridge to trigger Step Functions"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = "states:StartExecution"
        Effect   = "Allow"
        Resource = aws_sfn_state_machine.risk_scoring_workflow.id
      }
    ]
  })
}

# Attach Policy to Role
resource "aws_iam_role_policy_attachment" "eventbridge_to_sfn_attachment" {
  role       = aws_iam_role.eventbridge_to_sfn_role.name
  policy_arn = aws_iam_policy.eventbridge_to_sfn_policy.arn
}
