# Robo-Advisor Architecture Explained

## 1. What the Robo-Advisor Architecture Does

The current M1 architecture is composed of two primary systems:
- **Frontend**: A static React application hosted in an S3 bucket. It's served to users globally via CloudFront, which provides low-latency content delivery and a secure HTTPS connection using an ACM certificate.
- **Backend (Onboarding Service)**: A web service running on EC2 instances within a custom VPC. This service handles the initial user onboarding logic. It is designed for high availability and scalability from the ground up.

## 2. How It Scales and Secures Traffic

- **Scaling**: 
  - The backend relies on an **Auto Scaling Group (ASG)** that automatically adds or removes EC2 instances based on real-time load. 
  - It uses a **target tracking policy** based on the number of requests per target from the Application Load Balancer (ALB), ensuring the compute capacity always matches user demand.
  - The frontend on S3/CloudFront scales automatically to handle traffic spikes without any intervention.

- **Security**:
  - **Network Isolation**: The entire backend runs in a VPC with **public and private subnets**. The EC2 instances are located in private subnets, making them inaccessible from the public internet.
  - **Controlled Traffic Flow**: An **Application Load Balancer (ALB)** in the public subnet serves as the single entry point for all API traffic. **Security Groups** are used to create a strict firewall, ensuring instances only accept traffic from the ALB on the designated application port.
  - **Secure Frontend**: CloudFront uses **Origin Access Control (OAC)** to privately access the S3 bucket, preventing anyone from bypassing the CDN and accessing the website content directly.

## 3. Where I'd Improve the Current Setup

While the foundation is solid, several improvements could be made for a production-grade system:

1.  **Implement AWS WAF**: The most critical next step is to attach a **Web Application Firewall (WAF)** to the Application Load Balancer. This would provide immediate protection against common web exploits (like SQL injection, XSS) and add a layer of defense against DDoS attacks.
2.  **Decouple with SQS**: For the onboarding process, I would introduce an **SQS queue** to decouple the initial user request from the backend processing. This would make the system more resilient to traffic spikes and downstream failures. The user gets an immediate response, while the heavy lifting happens asynchronously.
3.  **Optimize Instance Launch Time**: I would create a **"Golden AMI"** with all application dependencies and configurations pre-baked. This would significantly reduce the time it takes for a new EC2 instance to become operational during a scale-out event.

```mermaid
graph TD
    subgraph "User"
        U("fa:fa-user User")
    end

    subgraph "AWS Cloud"
        subgraph "Frontend (Static Hosting)"
            CF[/"fa:fa-cloud CloudFront Distribution"/]
            S3[/"fa:fa-database S3 Bucket (Website)"/]
            ACM[/"fa:fa-lock ACM Certificate"/]
        end

        subgraph "Backend (Onboarding Service)"
            subgraph "VPC (robo-advisor-vpc)"
                IGW[/"fa:fa-globe Internet Gateway"/]
                
                subgraph "Availability Zone 1"
                    subgraph "Public Subnet 1"
                        ALB_NODE_1["fa:fa-server ALB Node"]
                        NAT[/"fa:fa-route NAT Gateway"/]
                    end
                    subgraph "Private Subnet 1"
                        EC2_1["fa:fa-desktop EC2 Instance"]
                    end
                end

                subgraph "Availability Zone 2"
                    subgraph "Public Subnet 2"
                        ALB_NODE_2["fa:fa-server ALB Node"]
                    end
                    subgraph "Private Subnet 2"
                        EC2_2["fa:fa-desktop EC2 Instance"]
                    end
                end

                subgraph "Routing"
                    RT_PUB(("fa:fa-route Public Route Table"))
                    RT_PRIV(("fa:fa-route Private Route Table"))
                end

                RT_PUB -- "0.0.0.0/0" --> IGW
                RT_PRIV -- "0.0.0.0/0" --> NAT
            end

            subgraph "Auto Scaling & Monitoring"
                ASG["fa:fa-layer-group Auto Scaling Group"]
                LT["fa:fa-file-alt Launch Template"]
                CW["fa:fa-watch CloudWatch Alarms"]
            end
            
            subgraph "Security"
                ALB_SG["fa:fa-shield-alt ALB Security Group"]
                INSTANCE_SG["fa:fa-shield-alt Instance Security Group"]
            end
        end
    end

    %% Connections
    U -->|HTTPS| CF
    CF -- "OAC" --> S3
    CF -- "ACM" --> ACM

    U -->|API Calls| ALB_SG --> ALB_NODE_1
    U -->|API Calls| ALB_SG --> ALB_NODE_2
    
    subgraph "ALB"
        direction LR
        ALB_NODE_1 <--> ALB_NODE_2
    end

    ALB_NODE_1 -->|Port 3000| INSTANCE_SG
    ALB_NODE_2 -->|Port 3000| INSTANCE_SG

    INSTANCE_SG --> EC2_1
    INSTANCE_SG --> EC2_2

    EC2_1 -->|Outbound| RT_PRIV
    EC2_2 -->|Outbound| RT_PRIV

    ASG --> LT
    ASG --- EC2_1
    ASG --- EC2_2

    CW -->|Scaling Policies| ASG

    %% Styling
    style U fill:#cde4ff,stroke:#333,stroke-width:1px,color:#000
    style CF fill:#f5f5f5,stroke:#333,stroke-width:2px,color:#000
    style S3 fill:#f5f5f5,stroke:#333,stroke-width:2px,color:#000
    style ACM fill:#f5f5f5,stroke:#333,stroke-width:2px,color:#000
    style IGW fill:#f5f5f5,stroke:#333,stroke-width:2px,color:#000
    style NAT fill:#f5f5f5,stroke:#333,stroke-width:2px,color:#000
    style ALB_NODE_1 fill:#fff2cc,stroke:#333,stroke-width:2px,color:#000
    style ALB_NODE_2 fill:#fff2cc,stroke:#333,stroke-width:2px,color:#000
    style EC2_1 fill:#d4e1f5,stroke:#333,stroke-width:2px,color:#000
    style EC2_2 fill:#d4e1f5,stroke:#333,stroke-width:2px,color:#000
    style ASG fill:#e1f5d4,stroke:#333,stroke-width:2px,color:#000
    style CW fill:#e1f5d4,stroke:#333,stroke-width:2px,color:#000
    style ALB_SG fill:#ffe6e6,stroke:#333,stroke-width:2px,color:#000
    style INSTANCE_SG fill:#ffe6e6,stroke:#333,stroke-width:2px,color:#000
```