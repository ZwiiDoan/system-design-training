# Month 1 Summary: AWS Foundations

## IAM & Security

### Key Concepts
- **IAM Policies**: JSON documents defining permissions.
- **IAM Roles**: Assumable identities with temporary credentials, ideal for services and federated users.
- **IAM Users vs. Roles**: Use roles for temporary access and users for long-term, AWS-native identities.
- **AWS Organizations & SCPs**: Service Control Policies act as guardrails, setting maximum permissions for accounts within an organization.
- **Federated Identity**: Enables users to access AWS with external credentials (e.g., Okta, Azure AD) by assuming an IAM role.

### Gotchas
- **Roles vs. Federated Identities**: A federated identity is an external user who *assumes* an IAM role to get temporary AWS credentials. The role is the AWS-side entity that grants the permissions.

## Networking

### Key Concepts
- **VPC**: A logically isolated network in AWS.
- **Subnets**: Public subnets for internet-facing resources (e.g., ALBs) and private subnets for internal resources (e.g., databases).
- **Routing Tables**: Control traffic flow. Public subnets route to an Internet Gateway; private subnets route to a NAT Gateway for outbound access.
- **VPC Peering**: Connects two VPCs privately.

### ADR-001 Reasoning
- **Decision**: Established a two-VPC (app and data) design with public/private subnets and VPC peering.
- **Rationale**: This isolates resources, provides secure outbound internet access via NAT, and allows private inter-VPC communication, creating a secure and scalable foundation.

## Compute & Scaling

### Key Concepts
- **EC2**: Virtual servers in the cloud.
- **Launch Templates**: Reusable configurations for EC2 instances, enabling consistent deployments and multi-instance-type Auto Scaling Groups.
- **Auto Scaling Groups (ASGs)**: Automatically adjust the number of EC2 instances based on demand, using scaling policies.
- **ALB (Application Load Balancer)**: Layer 7 load balancer for HTTP/S traffic, enabling path-based routing, health checks, and integration with services like WAF and Cognito.

## Frontend Hosting

### Key Concepts
- **S3 + CloudFront**: Host static websites in S3 and use CloudFront as a CDN for low-latency global delivery.
- **OAC (Origin Access Control)**: The recommended method to restrict S3 access to only CloudFront, preventing direct access to the bucket.
- **Cache Behavior**: CloudFront caches content at edge locations based on TTLs and `Cache-Control` headers from the origin (S3).
- **S3 Lifecycle Policies**: Automate moving data between storage tiers (e.g., S3 Standard -> Glacier) to reduce costs over time.

## Terraform Highlights

### Directory Structure
- A well-organized structure with separate directories for different services (e.g., `vpc-core`, `robo-advisor`) and modules.

### Common Patterns
- **Modules**: Reusable modules for components like VPCs, ALBs, and ASGs promote consistency and reduce code duplication.
- **Provider Setup**: Centralized provider configuration in `versions.tf`.

## Soft Skills

### Takeaways from "The Trusted Advisor"
- **Focus on the "Why"**: Understand the business context behind technical decisions.
- **Build Trust**: Be a reliable and honest partner to stakeholders.
- **Long-Term View**: Think about the long-term implications of architectural choices.