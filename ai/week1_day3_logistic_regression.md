# 📘 Week 1 Day 3 — Logistic Regression (ML Basics)

## 1. Introduction
Logistic Regression is a **classification algorithm** used to predict discrete outcomes (e.g., yes/no, spam/not spam, churn/no churn).  
Unlike linear regression (which predicts continuous values), logistic regression models the probability of belonging to a particular class.

---

## 2. The Logistic Function (Sigmoid)

The logistic regression model uses the **sigmoid function**:

\[
\sigma(z) = \frac{1}{1 + e^{-z}}
\]

- \( z = w^T x + b \)  
  - \( w \): weight vector (model parameters)  
  - \( x \): input features vector  
  - \( b \): bias term  

The sigmoid function maps any real number into the range \((0,1)\), which can be interpreted as a probability.

---

## 3. Model Hypothesis

\[
\hat{y} = P(y=1|x) = \sigma(w^T x + b)
\]

Where:
- \( \hat{y} \) is the predicted probability of the positive class (\(y=1\)).  
- If \( \hat{y} \geq 0.5 \), classify as 1 (positive class).  
- If \( \hat{y} < 0.5 \), classify as 0 (negative class).

---

## 4. Loss Function (Binary Cross-Entropy)

To train logistic regression, we minimize the **log loss** (cross-entropy):

\[
L = -\frac{1}{m} \sum_{i=1}^{m} \Big[ y^{(i)} \log(\hat{y}^{(i)}) + (1-y^{(i)}) \log(1-\hat{y}^{(i)}) \Big]
\]

Where:
- \( m \): number of training examples  
- \( y^{(i)} \): true label (0 or 1)  
- \( \hat{y}^{(i)} \): predicted probability  

---

## 5. Training with Gradient Descent

The parameters \( w \) and \( b \) are updated iteratively:

\[
w := w - \alpha \frac{\partial L}{\partial w}, \quad b := b - \alpha \frac{\partial L}{\partial b}
\]

- \( \alpha \): learning rate (step size in optimization).  
- Gradients are derived from the loss function using calculus.

---

## 6. Numerical Example

Suppose we have **one feature** (exam score) and a binary outcome (admitted or not).

| Score \(x\) | Admitted \(y\) |
|-------------|----------------|
| 50          | 0              |
| 70          | 0              |
| 90          | 1              |

1. Initialize \( w=0.1, b=-10 \).  
2. For \( x = 90 \):  
   \[
   z = (0.1)(90) - 10 = -1
   \]  
   \[
   \hat{y} = \sigma(-1) = \frac{1}{1 + e^1} \approx 0.27
   \]  
   → Model predicts only **27% chance of admission**, while actual label is 1.  
   → Training will adjust \( w \) and \( b \) to improve.

---

## 7. Python Implementation

```python
import numpy as np

# Sigmoid function
def sigmoid(z):
    return 1 / (1 + np.exp(-z))

# Logistic Regression training (gradient descent)
def train_logistic_regression(X, y, lr=0.01, epochs=1000):
    m, n = X.shape
    w = np.zeros(n)
    b = 0

    for _ in range(epochs):
        z = np.dot(X, w) + b
        y_hat = sigmoid(z)

        # Compute gradients
        dw = (1/m) * np.dot(X.T, (y_hat - y))
        db = (1/m) * np.sum(y_hat - y)

        # Update parameters
        w -= lr * dw
        b -= lr * db
    
    return w, b

# Example dataset
X = np.array([[50], [70], [90]])  # scores
y = np.array([0, 0, 1])           # admitted

w, b = train_logistic_regression(X, y)
print("Trained weights:", w, "bias:", b)

# Predict
new_score = np.array([80])
prob = sigmoid(np.dot(new_score, w) + b)
print("Admission probability:", prob)
```

---

## 8. Complexity Analysis
- Training requires iterating over all samples at each epoch.  
- **Time complexity:** \( O(m \times n \times epochs) \)  
  - \( m \): number of samples  
  - \( n \): number of features  
- **Space complexity:** \( O(n) \) (to store weights and bias).  

---

# 📝 Exercises — Logistic Regression

## Exercise 1: Sigmoid Function  
**Task:** Compute the sigmoid of \( z = -2, 0, 2 \).  

**Solution:**  
- \( \sigma(-2) = 0.12 \)  
- \( \sigma(0) = 0.5 \)  
- \( \sigma(2) = 0.88 \)  

---

## Exercise 2: Prediction with Logistic Regression  
Model: \( z = 0.2x - 5, \hat{y} = \sigma(z) \).  
For \( x = 30 \), predicted probability is **0.73**.

---

## Exercise 3: Implement Logistic Regression with scikit-learn

```python
import numpy as np
from sklearn.linear_model import LogisticRegression

X = np.array([[2], [4], [6], [8]])   # features
y = np.array([0, 0, 1, 1])           # labels

model = LogisticRegression()
model.fit(X, y)

print("Weight:", model.coef_)
print("Bias:", model.intercept_)

new_hours = np.array([[5]])
prob = model.predict_proba(new_hours)
print("Predicted probability of passing:", prob)
```

---

## Exercise 4: Decision Boundary  
If \( w = 1.2, b = -6 \), the decision boundary is at **x = 5**.  

---

✅ By today, you should understand **classification with logistic regression**, its **math foundation**, and how to implement it both **manually** and with **scikit-learn**.
