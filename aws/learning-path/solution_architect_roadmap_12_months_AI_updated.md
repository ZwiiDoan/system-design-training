
# 12‑Month Next‑Gen Solution Architect Roadmap  
*Sequential **AWS‑first → GCP‑second** path – ~1.5 h per day*  
*(Revised to embed AI/Gen‑AI elements throughout the AWS track while keeping the 12‑month duration)*  

---

## High‑Level Timeline (≈ 52 weeks)

| Month | Focus & Key Activities | Milestone / Check‑point |
|-------|-----------------------|-------------------------|
| 0 | **Kick‑off & Baseline** – skills matrix, multi‑cloud sandboxes, GitHub portfolio repo | Baseline competency map complete |
| 1‑3 | **AWS Foundations + Gen‑AI Basics** – core services **plus** Bedrock & SageMaker JumpStart labs | 3‑tier micro‑service on AWS + Titan Embeddings semantic search |
| 4‑6 | **AWS Advanced Architecture + Responsible AI & FinOps** – resilience, sustainability, AI guardrails, RAG mini‑showcase | Production‑grade workload, AI FinOps ADRs, Bedrock RAG demo |
| 7 | **AWS Exam Prep + Showcase** – practice tests, flash‑cards, polish "Cloud‑native Order System" (+ Bedrock RAG) | Sit **AWS SAP‑C02**, publish README & demos |
| 8‑9 | **GCP Foundations** – IAM, VPC‑SC, core services, IaC, Architecture Framework labs | Equivalent micro‑service on GCP |
| 10 | **GCP Advanced + Gen‑AI Patterns** – Vertex AI, LangChain, multi‑region HA | RAG micro‑service on Vertex AI & BigQuery |
| 11 | **GCP Exam Prep + Showcase** – practice tests, polish "Gen‑AI Order Insights" project | Sit **Google PCA**, publish README & demo |
| 12 | **Buffer & Portfolio Polish** – re‑sits, videos, LinkedIn posts, reflection | Portfolio complete, reflection note |

---

## Weekly Micro‑Cadence (applies every month)

| Day | Evening Activity | Minutes |
|-----|------------------|---------|
| Mon | Read / watch concept material | 45 |
| Tue | Quiz or flash‑cards | 45 |
| Wed | Hands‑on lab | 90 |
| Thu | Continue lab / reflection note | 90 |
| Fri | Deliverable commit (ADR / diagram / test) | 90 |
| Weekend (optional) | Slack buffer or deep dive | 60‑120 |

*The weekend buffer (~15 h per month) absorbs overruns without extending the calendar.*

---

## Month‑by‑Month Detail (AI‑infused)

### Month 0 — Kick‑off & Baseline
*Unchanged from previous version.*

---

### Month 1 — AWS Foundations I (Core Services)
*Unchanged:* IAM, Organisations, VPC basics, EC2, S3, CloudFront.  
**Deliverables:** ADR‑001 on subnetting & routing; S3 cost table.

---

### Month 2 — AWS Foundations II (Compute, Messaging & *First Gen‑AI Touch*)  

- **Concepts**  
  - Lambda, EventBridge, Step Functions.  
  - ECS Fargate vs EKS.  
  - **Amazon Bedrock & Titan Text Embeddings V2** basics.  
- **Lab (new)** – *“Hello LLM” semantic search*:  
  1. Call Titan Embeddings via Amazon Bedrock to vectorise product descriptions.  
  2. Store vectors in **Amazon OpenSearch Serverless** and expose a Lambda-powered search API. citeturn0search0turn0search4  
- **Deliverable** – sequence diagram + README, including Bedrock set‑up notes.

---

### Month 3 — AWS Advanced Architecture I (+ *Fine‑tuning Lab*)  

*SAP‑C02 Domain: Design for organisational complexity*  

- **Existing topics:** Landing Zone with Control Tower, SCP guardrails, network segmentation.  
- **New Mini‑Lab – SageMaker JumpStart Fine‑Tune**  
  - Fine‑tune a small **Llama‑2** model on order‑tracking FAQs using SageMaker JumpStart.  
  - Deploy behind API Gateway and CloudFront. citeturn0search1turn0search5  
- **Deliverable** – cost‑risk ADR for landing zone **plus** fine‑tuning runbook.

---

### Month 4 — AWS Advanced Architecture II (Resiliency, Performance & *Responsible AI*)  

- Chaos testing (AWS FIS), Aurora Serverless v2 global DB, sustainability metrics.  
- **Responsible‑AI Checklist**  
  - Review **AWS AI Service Cards** (Titan Embeddings) and map mitigations to STRIDE threats. citeturn0search2turn0search6  
- **Deliverable** – resilience scorecard + Responsible‑AI ADR.

---

### Month 5 — AWS Migration, **AI FinOps & Guardrails**

- Data migration (DMS, SCT, Snow).  
- **AI FinOps focus:**  
  - Track token counts, latency, and cost for Bedrock calls via CloudWatch.  
  - Set Lambda budget alerts for abnormal AI spend. citeturn0search7  
- **Lab:** simulate lift‑and‑shift to Aurora **plus** implement guardrail metrics dashboard.  
- **Checkpoint:** Mock SAP‑C02 exam #1 – target ≥ 60 %.

---

### Month 6 — AWS Exam Prep + *Bedrock RAG Mini‑Showcase*

- 3× full‑length SAP practice tests (Mon, Wed, Sun).  
- Polish **Project #1: Cloud‑native Order System**:  
  - Add CI/CD, blue‑green deploy, Titan search endpoint.  
- **New Gen‑AI add‑on** – *Bedrock RAG mini‑showcase*:  
  - Use **DynamoDB Vector Search** (zero‑ETL to OpenSearch) with Bedrock `retrieve_and_generate()` API for product Q&A. citeturn0search3turn0search8  
  - Record a 2‑min demo video.  
- **Goal:** sit **AWS SAP‑C02** by Week 32.

---

### Month 7 — GCP Foundations I
*Unchanged* (IAM vs VPC‑SC, Cloud DNS, Storage classes, Pulumi deployment, cost lab).

---

### Month 8 — GCP Foundations II
*Unchanged* (Cloud Run, GKE Autopilot, Pub/Sub, Functions, BigQuery basics, thumbnail pipeline).

---

### Month 9 — GCP Advanced + Gen‑AI Patterns
*Unchanged* (Vertex AI RAG, Embeddings, multi‑region HA, LangChain v0.4, OpenTelemetry).

---

### Month 10 — GCP Exam Prep + Showcase Sprint
*Unchanged* (practice tests, polish “Gen‑AI Order Insights”, sit Google PCA).

---

### Month 11 — Buffer, Polish & Reflection
*Unchanged* (re‑sits if needed; shoot explainer videos; LinkedIn posts; year‑end reflection).

---

## Staying on Track (Gate‑checks unchanged)

| Stage | Green ✅ | Yellow ⚠️ | Action on Yellow |
|-------|---------|-----------|------------------|
| End Month 3 mocks | ≥ 55 % | 40‑55 % | extra quiz sessions |
| End Month 6 mocks | ≥ 75 % | 60‑75 % | extend prep into Month 7 |
| End Month 8 quiz | ≥ 55 % | 40‑55 % | adjust study split |
| End Month 10 mocks | ≥ 70 % | 55‑70 % | use Month 11 buffer |

---

*Updated July 1 2025 to embed AI capabilities across the AWS track while preserving the 12‑month timeline.*
