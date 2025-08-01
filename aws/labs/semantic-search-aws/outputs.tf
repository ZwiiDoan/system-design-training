output "state_machine_arn" {
  description = "The ARN of the Step Functions state machine."
  value       = aws_sfn_state_machine.risk_scoring_workflow.id
}