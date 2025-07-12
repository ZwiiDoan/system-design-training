## Month 1: AWS Foundations for the Robo-Advisor Project

### ✅ Month 1 Goals
- **Master core AWS services**: IAM, VPC, EC2, S3, CloudFront.
- **Build the foundational infrastructure** for the **Robo-Advisor** showcase project.
- **Produce key architectural artifacts**: a network diagram and an Architecture Decision Record (ADR).

---

### 📅 Week-by-Week Breakdown

#### Week 1 — IAM & Core Network for the Robo-Advisor
| Day | Activity |
|-----|----------|
| Mon | Read IAM policies, roles, orgs & SCPs. |
| Tue | IAM quiz (roles vs users vs federated identities). |
| Wed | **Lab:** Build the core network (VPCs, subnets) for the Robo-Advisor via Terraform. |
| Thu | Add VPC peering & routing. |
| Fri | Commit **ADR-001:** Subnetting & routing strategy for the Robo-Advisor. |
| Weekend | Optional: IAM Org setup via Terraform. |

#### Week 2 — User Onboarding Service (EC2, ALB & Auto Scaling)
| Day | Activity |
|-----|----------|
| Mon | EC2, launch templates, autoscaling concepts. |
| Tue | ALB vs NLB quiz. |
| Wed | **Lab:** Deploy a mock "User Onboarding" service (ASG behind an ALB). |
| Thu | Add health checks and scaling policies to the service. |
| Fri | Commit Terraform code for the onboarding service. |
| Weekend | Write a short reflection on autoscaling edge cases. |

#### Week 3 — Robo-Advisor Frontend (S3 & CloudFront)
| Day | Activity |
|-----|----------|
| Mon | S3 storage classes & CloudFront concepts. |
| Tue | Quiz: S3 vs. CloudFront caching behavior. |
| Wed | **Lab:** Host the static frontend for the Robo-Advisor using S3 and CloudFront. |
| Thu | Add HTTPS and Origin Access Control (OAC). |
| Fri | Commit Terraform code for the static site. |
| Weekend | Write a brief on S3 data lifecycle policies for financial documents. |

#### Week 4 — Wrap-up, Review & Architect's Mindset
| Day | Activity |
|-----|----------|
| Mon | Consolidate all notes from the month. |
| Tue | Flashcards / review missed quizzes. |
| Wed | **Soft Skill:** Read a summary of "The Trusted Advisor". |
| Thu | Reflection: What are the key takeaways from the reading? |
| Fri | Finalize and commit the **Mermaid diagram** for the complete Month 1 architecture. |
| Weekend | Bonus: Prepare a short README explaining the Month 1 setup. |

---

### 📦 Deliverables (Due by end of Month 1)
| Type | Name | Description |
|------|------|-------------|
| ADR | `adr/001-robo-advisor-networking.md` | The decision record for the core network design. |
| Diagram | `diagrams/robo-advisor-M1-architecture.md` | A Mermaid diagram showing all infrastructure components. |
| Infra Code | `/labs/robo-advisor/` | All Terraform code for the project's foundation. |
| Soft Skill | `/notes/trusted-advisor-summary.md` | Personal notes and key takeaways from the reading. |

---

### ⏭️ Next Steps
1. Confirm if you already have:
   - AWS Free Tier set up
   - Terraform 1.9+, VS Code, Docker, and AWS CLI installed
2. Let me know if you want:
   - Day 1 specific reading material (IAM/VPC)
   - A Terraform scaffold/template for the VPC lab
   - An ADR template format