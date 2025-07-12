# 12‑Month Next‑Gen Solution Architect Roadmap (v3)
*Sequential **AWS‑first → GCP‑second** path – ~1.5 h per day*
*(Revised to use a Robo-Advisor showcase project)*

---

## Guiding Principles
- **Architectural Thinking:** Focus on the "why," not just the "how." Emphasize trade-offs, patterns, and business outcomes.
- **Governance as a Foundation:** Weave in cost management (FinOps), security, and responsible AI from the start.
- **Effective Communication:** An architect's ideas are only as good as their ability to convey them. Practice this continuously.

---

## High‑Level Timeline (≈ 52 weeks)

| Month | Focus & Key Activities | Milestone / Check‑point |
|-------|-----------------------|-------------------------|
| 0 | **Kick‑off & Baseline** – skills matrix, multi‑cloud sandboxes, GitHub portfolio repo | Baseline competency map complete |
| 1‑3 | **AWS Foundations, Gen‑AI Basics & Core Architect Skills** – core services, Bedrock, diagrams, ADRs | Core components of Robo-Advisor on AWS + ADRs |
| 4‑6 | **AWS Advanced Architecture, Responsible AI & FinOps** – resilience, sustainability, AI guardrails, TCO | Production‑grade Robo-Advisor, AI FinOps ADRs, Bedrock RAG demo & TCO |
| 7 | **AWS Exam Prep & Showcase** – practice tests, polish **"Cloud-Native Robo-Advisor"** (+ Bedrock RAG) | Sit **AWS SAP‑C02**, publish README & demos |
| 8‑9 | **GCP Foundations & Multi-Cloud Integration** – core services, Vertex AI, cross-cloud patterns | Equivalent micro‑service on GCP, integrated with AWS service |
| 10 | **GCP Advanced & Gen‑AI Patterns** – Vertex AI, LangChain, multi‑region HA | RAG micro‑service on Vertex AI & BigQuery |
| 11 | **GCP Exam Prep & Showcase** – practice tests, polish **"Gen-AI Portfolio Insights"** project | Sit **Google PCA**, publish README & demo |
| 12 | **Portfolio Polish & Strategic Communication** – videos, blog posts, reflection | Portfolio complete, reflection note, public-facing content |

---

## Month‑by‑Month Detail (Architect-Focused)

### Month 1 — AWS Foundations I (Core Services & Architect's Toolkit)
- **Technical Focus:** IAM, Organisations, VPC basics, EC2, S3, CloudFront.
- **Architect Deliverables:**
  - **ADR‑001:** Subnetting & routing strategy for the Robo-Advisor application.
  - **Diagram:** Create a Mermaid diagram of the target Robo-Advisor architecture.
  - **Soft Skill:** Read a summary of "The Trusted Advisor" to understand client-centric thinking.

### Month 2 — AWS Foundations II (Compute, Messaging & First Gen‑AI Touch)
- **Technical Focus:** Lambda, EventBridge, Step Functions, ECS Fargate vs. EKS, Amazon Bedrock & Titan Text Embeddings V2 basics.
- **Lab:** "Hello LLM" semantic search for financial terms (Bedrock, OpenSearch Serverless, Lambda).
- **Architect Deliverables:**
  - **Diagram:** Sequence diagram for the semantic search flow.
  - **Multi-Cloud Analysis:** Write a short comparison on how this lab would be built on GCP Vertex AI.

### Month 3 — AWS Advanced Architecture I (+ Fine‑tuning & Governance)
- **Technical Focus:** Landing Zone with Control Tower, SCP guardrails, network segmentation, SageMaker JumpStart Fine-Tuning.
- **Lab:** Fine‑tune a small Llama‑2 model on financial FAQs.
- **Architect Deliverables:**
  - **ADR‑002:** Justify the choice of fine-tuning vs. RAG for the FAQ use case, considering accuracy, cost, and maintenance.
  - **Soft Skill:** Draft a 1-page "Project Vision" document for the Robo-Advisor, aimed at a business stakeholder.

### Month 4 — AWS Advanced Architecture II (Resiliency, Performance & Responsible AI)
- **Technical Focus:** Chaos testing (AWS FIS), Aurora Serverless v2, sustainability metrics.
- **Responsible-AI Checklist:** Review AWS AI Service Cards and map mitigations to STRIDE threats for financial data.
- **Architect Deliverables:**
  - **ADR‑003:** Decision record for the chosen database (e.g., Aurora vs. DynamoDB for portfolio data) based on resilience and performance trade-offs.
  - **Multi-Cloud Analysis:** Compare the AWS and Google Cloud approaches to Responsible AI.

### Month 5 — AWS Migration, AI FinOps & Guardrails
- **Technical Focus:** Data migration (DMS, SCT, Snow), tracking AI costs with CloudWatch.
- **Lab:** Simulate lift‑and‑shift of user data to Aurora + implement a guardrail metrics dashboard for AI spend.
- **Architect Deliverables:**
  - **Soft Skill:** Create a 3-slide presentation for a non-technical audience explaining the business value of the RAG-based financial Q&A feature.
  - **Checkpoint:** Mock SAP‑C02 exam #1 – target ≥ 60%.

### Month 6 — AWS Exam Prep + Bedrock RAG Mini‑Showcase
- **Technical Focus:** 3× full‑length SAP practice tests, polish **Project #1: Cloud-Native Robo-Advisor** (CI/CD, blue-green deploy).
- **Gen‑AI Add-on:** Bedrock RAG mini‑showcase to answer questions about financial concepts ("Why invest in ETFs?").
- **Architect Deliverables:**
  - **TCO Analysis:** Create a Total Cost of Ownership estimate for the RAG showcase.
  - **Demo:** Record a 2-min demo video of the RAG feature.

### Month 7 — GCP Foundations I
- **Technical Focus:** IAM vs. VPC‑SC, Cloud DNS, Storage classes, Pulumi deployment, cost lab.
- **Architect Deliverable:** Re-create the Robo-Advisor architecture diagram from Month 1, but for GCP services.

### Month 8 — GCP Foundations II & Multi-Cloud Integration
- **Technical Focus:** Cloud Run, GKE Autopilot, Pub/Sub, Functions, BigQuery basics.
- **Lab:** Build a market data ingestion pipeline on GCP.
- **Architect Deliverables:**
  - **Soft Skill:** Write a blog post comparing the developer experience of deploying a service on AWS Lambda vs. GCP Cloud Run.
  - **Integration:** Design (diagram + notes) how the GCP market data service could be securely called by the AWS Robo-Advisor.

### Month 9 — GCP Advanced + Gen‑AI Patterns
- **Technical Focus:** Vertex AI Search and Conversation (RAG), Embeddings, multi‑region HA, LangChain.
- **Lab:** Build a RAG micro-service on Vertex AI & BigQuery for market news analysis.
- **Architect Deliverable:** **ADR-004:** Compare the trade-offs of using a managed service like Vertex AI Search vs. building a manual RAG pipeline with LangChain on GCP.

### Month 10 — GCP Exam Prep + Showcase Sprint
- **Technical Focus:** Practice tests, polish **Project #2: "Gen-AI Portfolio Insights"**.
- **Architect Deliverable:** Sit **Google PCA** exam.

### Month 11-12 — Buffer, Portfolio Polish & Reflection
- **Focus:** Re-sits if needed, refine all project READMEs, and consolidate architectural artifacts (ADRs, diagrams, TCO models).
- **Architect Deliverables:**
  - Shoot short explainer videos for your two main showcase projects.
  - Publish blog posts (from Month 8 and a new one reflecting on the journey).
  - Write a final reflection on the key lessons learned.

---

## Staying on Track (Gate‑checks unchanged)

| Stage | Green ✅ | Yellow ⚠️ | Action on Yellow |
|-------|---------|-----------|------------------|
| End Month 3 mocks | ≥ 55 % | 40‑55 % | extra quiz sessions |
| End Month 6 mocks | ≥ 75 % | 60‑75 % | extend prep into Month 7 |
| End Month 8 quiz | ≥ 55 % | 40‑55 % | adjust study split |
| End Month 10 mocks | ≥ 70 % | 55‑70 % | use Month 11 buffer |

---

*Updated July 10 2025 to use a Robo-Advisor showcase project.*