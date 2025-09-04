# 📅 Second Month Breakdown (Stage 1: Foundation — Continued)

## Week 5

* **Day 21 (Study - Python):** Probability & Statistics for ML (random variables, distributions, expectation).
* **Day 22 (Build - Go):** Add endpoint to fetch multiple crypto pairs (BTC, ETH, etc.).
  - Follow **anti‑churn architecture** on the backend (separate domain/services/transport).
  - Ensure the frontend **app-level hook** interface (`usePrices`) remains unchanged; only the infra adapter updates.
* **Day 23 (Study - Python):** Decision Trees (theory, splitting criteria, Python implementation).
* **Day 24 (Build - TypeScript):** Add dropdown in frontend to switch between crypto pairs.
  - Keep UI **library‑agnostic**: consume only from `features/crypto/app` (not TanStack/Redux directly).
  - Extend `domain/` schemas for multiple symbols; adapt `infra/` to new endpoint; **no UI changes** beyond the dropdown.
* **Day 25 (Study - Python):** Vectorization & Performance (NumPy optimizations for ML).

## Week 6

* **Day 26 (Study - Python):** Evaluation Metrics (accuracy, precision, recall, F1, ROC, AUC).
* **Day 27 (Build - Go + Postgres):** Persist multiple crypto assets in Postgres.
  - Data model versioned; API responses validated in the frontend via **zod** schemas.
  - **MSW** updated to mirror new persistence shape for e2e dev flow.
* **Day 28 (Study - Python):** Feature Engineering Basics (scaling, encoding, transformations).
* **Day 29 (Build - TypeScript):** Add table to frontend to list saved crypto prices.
  - Table renders **domain types**; fetching still via `usePrices` hook (infra handles pagination/caching).
* **Day 30 (Study - Python):** LLM Prompt Patterns (chain-of-thought, role prompting, self-consistency).

## Week 7

* **Day 31 (Study - Python):** K-Nearest Neighbors (theory, distance metrics, Python implementation).
* **Day 32 (Build - Go):** Implement simple moving average (SMA) indicator in backend.
  - Expose as `/api/v1/indicators/sma`; frontend adds `useSMA` **app hook** with its own domain schema.
* **Day 33 (Study - Python):** Support Vector Machines (intuition, kernel trick, Python code).
* **Day 34 (Build - TypeScript):** Display SMA indicator overlay on frontend chart.
  - Chart components consume only **app‑level hooks** (`useSMA`, `usePrices`), keeping charting lib swappable.
* **Day 35 (Study - Python):** Fine-tuning LLMs (overview, parameter-efficient methods).

## Week 8

* **Day 36 (Study - Python):** Ensemble Methods (bagging, boosting, random forest, gradient boosting).
* **Day 37 (Build - Go):** Add exponential moving average (EMA) indicator in backend.
  - Mirror SMA design; reuse indicator adapter pattern to keep endpoints consistent.
* **Day 38 (Study - Python):** Intro to Unsupervised Learning (clustering: k-means, hierarchical).
* **Day 39 (Build - TypeScript):** Frontend toggle between SMA/EMA charts.
  - Toggle lives in **UI state adapter** (Zustand today); `useIndicatorPrefs()` exported from `core/state`.
* **Day 40 (Study - Python):** LLM Integration Case Study (chatbot + finance education).

---

🎯 **End of Month 2 Milestone (with anti‑churn guardrails):**
* Feature areas expose **stable app‑level hooks**; libraries live only in **infra**.
* Frontend remains **library‑agnostic**; backend follows clear boundaries (domain/services/transport).
* MSW mirrors real endpoints, enabling UI progress independent of backend.
