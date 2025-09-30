# Week 2 Day 5 — Study (Python)

## Topic: Prompt Engineering Basics

### 1. Principles
- **Clarity**: Be explicit in what you ask.  
- **Context**: Provide background so the model understands intent.  
- **Constraints**: Specify format, style, or length.  

### 2. Techniques
- **Instruction prompting**: “Explain gradient descent in simple terms.”  
- **Few-shot prompting**: Give examples, then ask for a continuation.  
- **Role prompting**: “You are a financial analyst…”  
- **Chain-of-thought prompting**: Encourage step-by-step reasoning.  
- **Self-consistency**: Ask model to produce multiple solutions, then pick the best.  

### 3. Examples
- **Poor**: “Explain regression.”  
- **Better**: “Explain linear regression in Python, with math, a simple dataset example, and code.”  

### 4. Mini-exercise (Python)
```python
from openai import OpenAI

client = OpenAI()

prompt = "You are a tutor. Explain logistic regression to a beginner with:\n" \
         "1. A real-world example\n" \
         "2. The math formula\n" \
         "3. A Python code example\n" \
         "Keep it concise and clear."

response = client.chat.completions.create(
    model="gpt-4.1",
    messages=[{"role": "user", "content": prompt}]
)

print(response.choices[0].message["content"])
```

### 5. Outcome
You understand how to craft prompts that lead to higher-quality responses from LLMs.
