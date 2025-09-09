# 📘 Week 2 Day 1 (Study – Python)

## Topic: Gradient Descent

### 1. Intuition
Gradient Descent is an **optimization algorithm** used to minimize a cost function (loss).  
Think of it as “rolling downhill” on a curve until reaching the lowest point.

- The “hill” = cost function (e.g., Mean Squared Error).  
- The “slope” = derivative of the cost function.  
- The step size is controlled by a **learning rate (α)**.

---

### 2. Math Derivation
We update parameters (θ) iteratively:

\[
\theta := \theta - \alpha \cdot \frac{\partial J(\theta)}{\partial \theta}
\]

Where:
- \(\theta\) = model parameter(s) (e.g., weight, bias).
- \(J(\theta)\) = cost function.
- \(\alpha\) = learning rate (step size).
- \(\frac{\partial J(\theta)}{\partial \theta}\) = gradient (slope).

---

### 3. Numerical Example
Suppose we want to minimize:

\[
J(\theta) = \theta^2
\]

- Gradient: \(\frac{\partial J}{\partial \theta} = 2\theta\).  
- Start with \(\theta = 4\), learning rate \(\alpha = 0.1\).  

Iteration steps:
1. \(\theta := 4 - 0.1 \times 2(4) = 3.2\)  
2. \(\theta := 3.2 - 0.1 \times 2(3.2) = 2.56\)  
3. \(\theta := 2.56 - 0.1 \times 2(2.56) = 2.048\)  

It converges toward 0 (the minimum).

---

### 4. Python Implementation
```python
import numpy as np

# Cost function J(θ) = θ^2
def cost(theta):
    return theta**2

# Gradient ∂J/∂θ = 2θ
def gradient(theta):
    return 2 * theta

# Gradient Descent
theta = 4.0  # initial value
alpha = 0.1  # learning rate
iterations = 10

for i in range(iterations):
    theta = theta - alpha * gradient(theta)
    print(f"Step {i+1}: θ = {theta:.4f}, Cost = {cost(theta):.4f}")
```

---

### 5. Complexity Analysis
- Each iteration computes the gradient and updates parameters: **O(1)** in this simple case.  
- For ML models with \(n\) features and \(m\) data points:
  - Complexity per iteration: **O(m · n)** (since gradient must consider all samples and features).  
- Convergence depends on:
  - Learning rate (too high → divergence, too low → slow).
  - Convexity of the cost function (guaranteed minimum only in convex cases).

---

✅ By the end of today, you should understand:
- The concept of Gradient Descent as optimization.  
- How learning rate controls convergence.  
- A working Python implementation.
