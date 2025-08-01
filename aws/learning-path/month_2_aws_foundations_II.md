
# Month 2 Plan — AWS Foundations II: Event-Driven Compute & Gen-AI Touchpoint

## ✅ Month 2 Goals
- Understand and deploy event-driven patterns (Lambda, EventBridge, Step Functions).
- Explore container orchestration choices: ECS Fargate vs. EKS.
- Build a semantic search PoC using Bedrock + OpenSearch Serverless.
- Produce architectural artifacts: sequence diagram, cloud comparison brief.

---

## 📅 Week-by-Week Breakdown

### Week 1 — Event-Driven Compute: Lambda, EventBridge & Step Functions
| Day | Activity |
|-----|----------|
| Mon | Read about Lambda event sources, execution models, and limits. |
| Tue | Quiz: EventBridge vs SNS vs SQS (use cases, fan-out, ordering). |
| Wed | **Lab:** Wire up Lambda triggered via EventBridge from a mock "transaction submitted" event. |
| Thu | Add Step Functions to simulate a basic "risk scoring" workflow. |
| Fri | Commit a **sequence diagram** showing the event-driven flow. |
| Weekend | Write a short note comparing synchronous vs async orchestration strategies. |

---

### Week 2 — Containers on AWS: ECS Fargate vs. EKS Deep Dive
| Day | Activity |
|-----|----------|
| Mon | Read: ECS vs EKS trade-offs (cost, complexity, autoscaling). |
| Tue | Quiz: Which to choose when? Stateless apps, batch jobs, GPU use. |
| Wed | **Lab:** Deploy a simple containerized "portfolio simulator" API to ECS Fargate. |
| Thu | Try the same deployment using EKS (via `eksctl` or Terraform). |
| Fri | Commit a trade-off note or ADR draft: Fargate vs EKS for Robo-Advisor. |
| Weekend | Optional: Add CloudWatch monitoring & alarms to your deployment. |

---

### Week 3 — Semantic Search Lab: Bedrock + OpenSearch
| Day | Activity |
|-----|----------|
| Mon | Read: Bedrock Titan Embeddings V2 + OpenSearch vector search. |
| Tue | Quiz: Embeddings vs keywords, cosine similarity vs BM25. |
| Wed | **Lab:** Upload 20 financial definitions, embed with Bedrock, store in OpenSearch Serverless. |
| Thu | Add a Lambda function to perform a "semantic search" (e.g., “What is ETF?”). |
| Fri | Commit code + a **sequence diagram** for the end-to-end flow. |
| Weekend | Optional: Add a basic Web UI (React/S3) to query the system. |

---

### Week 4 — Architect's Mindset: Cross-Cloud Thinking & Review
| Day | Activity |
|-----|----------|
| Mon | Read: Intro to GCP Vertex AI embeddings and vector search. |
| Tue | **Write:** 1-page comparison: “How would this semantic search be built on GCP?” |
| Wed | Quiz review: revisit all major quiz concepts from Month 2. |
| Thu | Soft Skill: Read a summary of “Made to Stick” — lessons in communicating technical ideas clearly. |
| Fri | Reflection: What was hardest this month? Where do ECS/EKS/Bedrock fit in a broader solution? |
| Weekend | Bonus: Write a public-facing README for the semantic search PoC. |

---

## 📦 Month 2 Deliverables
| Type | Name | Description |
|------|------|-------------|
| Diagram | `diagrams/event-driven-sequence.mmd` | Sequence diagram showing Lambda + EventBridge + Step Functions |
| Infra Code | `/labs/semantic-search-aws/` | Terraform + Lambda + OpenSearch for Bedrock semantic search |
| ADR | `adr/002-ecs-vs-eks.md` (optional) | Compute platform decision for the Robo-Advisor |
| Brief | `/notes/gcp-comparison-semantic-search.md` | GCP vs AWS: building semantic search |
| Soft Skill | `/notes/made-to-stick-summary.md` | Communication patterns for explaining architecture |

---

## ⏭️ Prerequisites Check (Before Month 2 Starts)
- ✅ Terraform, AWS CLI, Bedrock access via IAM role confirmed.
- ✅ OpenSearch Serverless access and Bedrock model access (Titan or Claude embeddings).
- 🔄 Let me know if you'd like:
  - A scaffolded lab repo for the Bedrock+OpenSearch PoC
  - Terraform templates for ECS/EKS lab deployments
  - Quiz templates for Lambda, Step Functions, Embeddings

---

## 🔁 Optional Week 5 (Buffer / Extension)
Use this week if any prior topics were delayed or if you want to:
- Extend the Bedrock PoC into a full financial Q&A feature
- Explore OpenSearch Dashboards for vector analytics
- Draft a multi-cloud architecture with hybrid AWS+GCP elements
