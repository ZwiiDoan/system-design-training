
# Lambda Functions
resource "aws_lambda_function" "transaction_producer" {
  filename         = "transaction-producer.zip"
  function_name    = "transaction-producer"
  role             = aws_iam_role.lambda_role.arn
  handler          = "index.handler"
  runtime          = "python3.9"
  source_code_hash = data.archive_file.transaction_producer_zip.output_base64sha256
}

resource "aws_lambda_function" "receive_transaction" {
  filename         = "receive-transaction.zip"
  function_name    = "receive-transaction"
  role             = aws_iam_role.lambda_role.arn
  handler          = "index.handler"
  runtime          = "python3.9"
  source_code_hash = data.archive_file.receive_transaction_zip.output_base64sha256
}

resource "aws_lambda_function" "check_amount" {
  filename         = "check-amount.zip"
  function_name    = "check-amount"
  role             = aws_iam_role.lambda_role.arn
  handler          = "index.handler"
  runtime          = "python3.9"
  source_code_hash = data.archive_file.check_amount_zip.output_base64sha256
}

resource "aws_lambda_function" "score_risk" {
  filename         = "score-risk.zip"
  function_name    = "score-risk"
  role             = aws_iam_role.lambda_role.arn
  handler          = "index.handler"
  runtime          = "python3.9"
  source_code_hash = data.archive_file.score_risk_zip.output_base64sha256
}

resource "aws_lambda_function" "notify" {
  filename         = "notify.zip"
  function_name    = "notify"
  role             = aws_iam_role.lambda_role.arn
  handler          = "index.handler"
  runtime          = "python3.9"
  source_code_hash = data.archive_file.notify_zip.output_base64sha256
}

# Data archives for the Lambda functions
data "archive_file" "transaction_producer_zip" {
  type        = "zip"
  source_dir  = "${path.module}/src/transaction-producer"
  output_path = "${path.module}/archive/transaction-producer.zip"
}

data "archive_file" "receive_transaction_zip" {
  type        = "zip"
  source_dir  = "${path.module}/src/receive-transaction"
  output_path = "${path.module}/archive/receive-transaction.zip"
}

data "archive_file" "check_amount_zip" {
  type        = "zip"
  source_dir  = "${path.module}/src/check-amount"
  output_path = "${path.module}/archive/check-amount.zip"
}

data "archive_file" "score_risk_zip" {
  type        = "zip"
  source_dir  = "${path.module}/src/score-risk"
  output_path = "${path.module}/archive/score-risk.zip"
}

data "archive_file" "notify_zip" {
  type        = "zip"
  source_dir  = "${path.module}/src/notify"
  output_path = "${path.module}/archive/notify.zip"
}
