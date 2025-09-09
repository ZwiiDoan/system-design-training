# 📘 Week 1 — Day 5 (Study: Python)

## Topic: **Generative AI — Introduction to LLMs**

---

## 1. What are LLMs?

- **Large Language Models (LLMs):**  
  Deep neural networks (often *Transformers*) trained on huge text datasets to predict the next token in a sequence.
- **Why “large”?**  
  - Billions of parameters → capture complex patterns.  
  - Example: GPT-4 (1T+ parameters), LLaMA-3 (8B–70B).  
- **Applications:**  
  - Summarization, translation, reasoning, coding, Q&A.

---

## 2. Transformer Architecture (Core of LLMs)

### Key Components:
- **Embedding layer:** Converts words/tokens into vectors.  
- **Self-attention mechanism:** Lets each token focus on others in the sequence.  
- **Feed-forward layers:** Apply nonlinear transformations.  
- **Positional encoding:** Adds order info since attention is position-agnostic.  

### Formula: Self-Attention
\[
\text{Attention}(Q, K, V) = \text{softmax}\left(\frac{QK^T}{\sqrt{d_k}}\right)V
\]

- **Q (Query):** Vector representing current token.  
- **K (Key):** Vectors representing other tokens.  
- **V (Value):** Information carried by each token.  
- **\( d_k \):** Dimensionality of key vectors.  
- **Softmax:** Converts scores into probability distribution.

---

### Numerical Example

Suppose we have **2 tokens**, each represented by a 2D vector.  

- Query (Q) = \([1, 0]\)  
- Keys (K) = \(\{[1, 0], [0, 1]\}\)  
- Values (V) = \(\{[5, 5], [10, 0]\}\)  
- \( d_k = 2 \)

1. Compute dot products:  
   - \( QK_1^T = [1,0]\cdot[1,0] = 1 \)  
   - \( QK_2^T = [1,0]\cdot[0,1] = 0 \)

2. Scale:  
   - Divide by \(\sqrt{2} \approx 1.41\): \([0.71, 0]\)

3. Apply softmax:  
   \(\text{softmax}([0.71,0]) \approx [0.67, 0.33]\)

4. Weighted sum of values:  
   \(0.67 \times [5,5] + 0.33 \times [10,0] = [6.67, 3.33]\)

👉 The token attends **more strongly** to the first value.

---

## 3. Training Objective

- **Task:** Predict next token given context.  
- **Loss function:** Cross-entropy loss comparing predicted token distribution vs. ground truth.  
- **Scaling Laws:** More data + larger models → better performance (with diminishing returns).  

---

## 4. Prompting Techniques

### a) Zero-shot
> “Explain dollar-cost averaging in simple terms.”

### b) Few-shot
Provide examples in the prompt to guide output.

### c) Chain-of-Thought
> “Explain step by step: How does compound interest grow a $1,000 investment at 5% annually?”

### d) Role prompting
> “You are a financial tutor. Explain Bitcoin like I’m 12.”

---

## 5. Case Studies for Investment Platform

- **News Summarization:** Summarize latest BTC/ETH headlines.  
- **Natural Language → API:**  
  “Show me ETH price over the last 7 days” → Go backend query.  
- **Education Tab (AI Tutor):**  
  User asks “What is an ETF?” → LLM explains.  
- **Code Generation:** Automate TypeScript API scaffolds.

---

## 6. Hands-on Python

### Basic Query

```python
from openai import OpenAI

client = OpenAI()

response = client.chat.completions.create(
    model="gpt-4.1-mini",
    messages=[
        {"role": "system", "content": "You are a financial tutor."},
        {"role": "user", "content": "Explain dollar-cost averaging in 3 sentences."}
    ]
)

print(response.choices[0].message["content"])
```

---

### Exercise: Prompt Playground

Build a Python script that:
1. Takes a user question (finance-related).  
2. Sends it to the LLM.  
3. Saves both prompt + answer into a `.log` file.

```python
import datetime
from openai import OpenAI

client = OpenAI()

def query_llm(user_prompt: str):
    response = client.chat.completions.create(
        model="gpt-4.1-mini",
        messages=[
            {"role": "system", "content": "You are an investment tutor."},
            {"role": "user", "content": user_prompt}
        ]
    )
    return response.choices[0].message["content"]

if __name__ == "__main__":
    question = input("Ask your AI tutor: ")
    answer = query_llm(question)

    print("AI Tutor:", answer)

    with open("llm_log.txt", "a") as f:
        f.write(f"{datetime.datetime.now()} - Q: {question}\nA: {answer}\n\n")
```

Try these queries:
- “Explain ETF vs Stock in plain English.”  
- “Summarize Bitcoin’s price trends in the last year.”  
- “Write a SQL query to get top 5 trades by volume from a table `trades`.”

---

## 7. Complexity & Trade-offs

- **Training complexity:**  
  - \(O(N^2)\) for attention (N = sequence length).  
  - High GPU/TPU cost.  
- **Inference trade-offs:**  
  - Smaller models = faster, cheaper.  
  - Larger models = smarter, but slower + costly.  
- **Risks:**  
  - Hallucinations.  
  - Sensitive to prompt wording.  
  - Mitigation: Retrieval-Augmented Generation (RAG).

---

## 8. Today’s Mini Project

🎯 Build a **Python LLM Playground** where:
1. User types finance questions.  
2. LLM answers + logs results.  
3. Experiment with different prompting styles.

---

✅ **By the end of Day 5 you will:**
- Understand LLM theory & Transformer attention math.  
- Know multiple prompting strategies.  
- Run Python LLM queries.  
- Have a mini playground for experimenting with finance-related queries.  
