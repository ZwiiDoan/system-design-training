## Month 1: AWS Foundations I (Core Services)

### ✅ Month 1 Goals
- **Master core AWS services**: IAM, VPC, EC2, S3, CloudFront  
- **Hands-on labs**:
  - Two VPCs via Terraform (with public/private subnets, peering)
  - EC2 Auto Scaling Group behind an ALB
  - Static web assets via S3 + CloudFront
- **Architecture deliverables**:
  - `ADR-001`: subnetting & routing decisions
  - Cost comparison table: S3 Standard vs Infrequent Access

---

### 📅 Week-by-Week Breakdown

#### Week 1 — IAM & VPC Deep Dive
| Day | Activity |
|-----|----------|
| Mon | Read IAM policies, roles, orgs & SCPs (AWS docs / ACG / Udemy) |
| Tue | IAM quiz (roles vs users vs federated identities) |
| Wed | VPC lab: 2 VPCs (public/private), Terraform init |
| Thu | Add VPC peering & basic routing |
| Fri | Commit ADR-001: Subnetting & routing decision |
| Weekend | Optional: IAM Org setup via Terraform |

#### Week 2 — EC2, ALB & Auto Scaling
| Day | Activity |
|-----|----------|
| Mon | EC2, launch templates, autoscaling concepts |
| Tue | ALB vs NLB quiz |
| Wed | EC2 ASG behind ALB lab |
| Thu | Add health checks, scaling policies |
| Fri | Diagram infra + commit Terraform + update ADR |
| Weekend | Write postmortem on autoscaling edge cases (timeouts, limits) |

#### Week 3 — S3 & CloudFront
| Day | Activity |
|-----|----------|
| Mon | S3 classes & CloudFront intro |
| Tue | Quiz: storage classes & CloudFront behavior |
| Wed | Lab: static site with S3 + CloudFront |
| Thu | Add HTTPS, OAI/Origin Access Control |
| Fri | Cost comparison table: S3 Standard vs IA |
| Weekend | Write brief on S3 data lifecycle policies |

#### Week 4 — Wrap-up & Review
| Day | Activity |
|-----|----------|
| Mon | Consolidate notes: IAM + VPC + EC2 + S3 |
| Tue | Flashcards / review missed quizzes |
| Wed | Lab clean-up, retry errors |
| Thu | Reflection note: What changed in your understanding of core services |
| Fri | Final commits: ADR + cost table + infra diagram |
| Weekend | Bonus: Prepare a short Loom or markdown README explaining the Month 1 setup |

---

### 📦 Deliverables (Due by end of Month 1)
| Type | Name |
|------|------|
| ADR | `adr/001-subnetting-routing.md` |
| Infra Code | Terraform code in `/labs/vpc-core`, `/labs/ec2-asg`, `/labs/s3-static-site` |
| Diagram | `/diagrams/month1-core-services.puml` (PlantUML or Mermaid) |
| Cost | `/docs/s3-cost-comparison.md` |
| Reflection | `/notes/month1-reflection.md` |

---

### ⏭️ Next Steps
1. Confirm if you already have:
   - AWS Free Tier set up
   - Terraform 1.9+, VS Code, Docker, and AWS CLI installed
2. Let me know if you want:
   - Day 1 specific reading material (IAM/VPC)
   - A Terraform scaffold/template for VPC lab
   - ADR template format

