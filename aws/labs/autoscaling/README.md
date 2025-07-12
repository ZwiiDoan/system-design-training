# Lab: Auto Scaling with Launch Templates

This Terraform project demonstrates:
- Creating a Launch Template (web-lt-v1) targeting t3.micro in the default VPC
- Creating a second template version overriding the AMI with the latest Amazon Linux 2023
- CLI steps to create an Auto Scaling Group and observe the new 2025 API enhancement

## Usage

1. **Initialize and apply Terraform:**
   ```sh
   terraform init
   terraform apply
   ```
   This will create two launch templates (v1: Amazon Linux 2, v2: Amazon Linux 2023).

2. **Create the Auto Scaling Group via CLI:**
   Replace `<LT_ID>` with the ID of the launch template created by Terraform (see Terraform output or AWS Console).
   ```sh
   aws autoscaling create-auto-scaling-group \
     --auto-scaling-group-name web-asg-demo \
     --launch-template LaunchTemplateId=lt-0ef1b870eef654027,Version=2 \
     --min-size 1 --max-size 3 --desired-capacity 2 \
     --vpc-zone-identifier subnet-0def45c65904f3351,subnet-09dd34b8c383d457b,subnet-07672e88587236bfb
   ```
   (You can get subnet IDs for your default VPC with:
   `aws ec2 describe-subnets --filters Name=default-for-az,true --query 'Subnets[*].SubnetId' --output text`)

3. **Describe the Auto Scaling Group with the new filter:**
   ```sh
   aws autoscaling describe-auto-scaling-groups --auto-scaling-group-names web-asg-demo --no-include-instances
   ```
   You should see a trimmed response without instance details.

## Notes
- No load balancer is attached in this lab.
- You can destroy all resources with:
   ```sh
   terraform destroy
   ```
