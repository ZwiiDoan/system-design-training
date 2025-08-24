# Portfolio Simulator ECS Fargate Deployment

This Terraform project deploys the Portfolio Simulator API to AWS ECS Fargate.

## Prerequisites
- AWS CLI configured
- Terraform >= 1.3.0


## Usage

1. Update variables in `variables.tf` as needed.
2. Run:
   ```powershell
   terraform apply
   ```

## Resources Created
- ECS Cluster
- ECS Task Definition
- ECS Fargate Service
- IAM Roles
- Security Group
- Application Load Balancer
