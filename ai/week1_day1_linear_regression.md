# 📘 Week 1 – Day 1: Linear Regression

## 1. Intuition

Linear Regression is the simplest supervised ML algorithm.

* **Goal:** Predict a continuous value (e.g., house price, stock return) from input features.
* **Assumption:** Relationship between inputs and output is approximately linear.

**Example:** Predict house price from size.
$\text{price} \approx w \cdot \text{size} + b$

---

## 2. Mathematical Formulation

### Hypothesis function

For one feature:
$\hat{y} = w \cdot x + b$

Where:

* $\hat{y}$: predicted output (e.g., predicted house price in \$k)
* $x$: input feature (e.g., house size in m²)
* $w$: weight/slope (change in prediction per unit change in $x$)
* $b$: bias/intercept (prediction when $x=0$)

**Numerical Example:**
If $w = 2.5$, $b = 25$, and $x = 100$:
$\hat{y} = 2.5 \times 100 + 25 = 275$
→ Predicted price = **\$275k**.

#### Multi-feature version

$\hat{y} = w_1 x_1 + w_2 x_2 + \dots + w_n x_n + b$

Where:

* $x_j$: the $j$-th feature (e.g., size, bedrooms)
* $w_j$: weight for feature $x_j$
* $n$: number of features

**Numerical Example:**
If $x_1 = 80$ (size), $x_2 = 3$ (bedrooms), $w_1 = 2.0$, $w_2 = 10$, $b = 20$:
$\hat{y} = 2.0 \cdot 80 + 10 \cdot 3 + 20 = 210$
→ Predicted price = **\$210k**.

---

## 3. Loss Function (Mean Squared Error)

$J(w, b) = \frac{1}{m} \sum_{i=1}^{m} (\hat{y}^{(i)} - y^{(i)})^2$

Where:

* $J(w,b)$: loss/cost for parameters $w,b$
* $m$: number of training examples
* $i$: index of a training example
* $x^{(i)}$: inputs of example $i$
* $y^{(i)}$: true label/target of example $i$
* $\hat{y}^{(i)}$: prediction for example $i$

**Numerical Example:**
Dataset: $(x,y) = (50,150), (60,180), (70,200)$.
If $w = 2.5$, $b = 25$:

* Predictions: \[150, 175, 200]
* Errors: \[0, -5, 0]
* Squared errors: \[0, 25, 0]
  $J = \frac{1}{3}(0+25+0) = 8.33$

---

## 4. Optimization: Gradient Descent

The goal of training is to **find values of w and b that minimize the loss function** $J(w,b)$. To do this, we use **Gradient Descent**.

### What is Gradient Descent?

It’s an iterative optimization algorithm. We start with random (or zero) values for $w$ and $b$, then repeatedly adjust them in the direction that reduces the error.

### Update rules:

$w \leftarrow w - \alpha \cdot \frac{\partial J}{\partial w}, \quad b \leftarrow b - \alpha \cdot \frac{\partial J}{\partial b}$

* $\alpha$ (**learning rate**): controls the step size in each update. If too large → overshoot the minimum. If too small → training is very slow.
* $\frac{\partial J}{\partial w}, \frac{\partial J}{\partial b}$ (**gradients/slopes**): these measure how sensitive the loss function is to changes in $w$ and $b$. Intuitively, they tell us the slope of the error curve. If the slope is steep, we make bigger adjustments.

### Gradient formulas:

$\frac{\partial J}{\partial w} = \frac{2}{m}\sum_{i=1}^{m} (\hat{y}^{(i)} - y^{(i)})x^{(i)}, \quad \frac{\partial J}{\partial b} = \frac{2}{m}\sum_{i=1}^{m} (\hat{y}^{(i)} - y^{(i)})$

### Relation to Other Content

* **Hypothesis function:** gives $\hat{y}$ (predictions).
* **Loss function:** measures how far $\hat{y}$ is from the true $y$.
* **Gradient Descent:** adjusts $w, b$ to reduce the loss.
  Together, they form the training loop.

### Numerical Example

Dataset: (50,150), (60,180), (70,200). Start with $w=0, b=0$, learning rate $\alpha=0.0005$.

* Predictions = \[0,0,0]
* Errors = \[-150,-180,-200]
* Gradients: $\frac{\partial J}{\partial w} = -21533.3$, $\frac{\partial J}{\partial b} = -353.3$
* Updates: $w=10.77$, $b=0.18$

Repeating this many times gradually reduces the loss and finds the best-fitting line.

---

## 5. Python Implementation (from scratch)

```python
import numpy as np

class LinearRegressionGD:
    def __init__(self, lr=1e-4, epochs=1000):
        self.lr = lr
        self.epochs = epochs
        self.w = 0.0
        self.b = 0.0

    def fit(self, X, y):
        X = np.asarray(X, dtype=float)
        y = np.asarray(y, dtype=float)
        m = X.shape[0]
        for _ in range(self.epochs):
            y_hat = self.w * X + self.b
            error = y_hat - y  # shape (m,)
            dw = (error * X).mean() * 2.0  # ∂J/∂w
            db = error.mean() * 2.0         # ∂J/∂b
            self.w -= self.lr * dw
            self.b -= self.lr * db
        return self

    def predict(self, X):
        X = np.asarray(X, dtype=float)
        return self.w * X + self.b

# Example usage
if __name__ == "__main__":
    X = np.array([50, 60, 70, 80, 90])
    y = np.array([150, 180, 200, 220, 240])

    model = LinearRegressionGD(lr=1e-4, epochs=10000).fit(X, y)
    print("w:", model.w, "b:", model.b)
    print("Prediction for 100:", model.predict(100))
```

### (Optional) Using scikit-learn for sanity-check

```python
from sklearn.linear_model import LinearRegression
import numpy as np

X = np.array([[50],[60],[70],[80],[90]])
y = np.array([150,180,200,220,240])

sk = LinearRegression().fit(X, y)
print("w:", sk.coef_[0], "b:", sk.intercept_)
print("Prediction for 100:", sk.predict([[100]])[0])
```

---

## 6. Complexity Analysis

* **Training (per epoch):** $O(m)$, where $m$ = number of samples.
* **Prediction:** $O(1)$.
* **Space:** $O(1)$ (just weights and bias).

---

## ✅ Outcome for Day 1

* You understand linear regression theory, formulas, and optimization.
* You’ve seen a concrete Python implementation.
* You’re ready for **Day 2 (Build): API skeleton**.

---

## 🏋️ Practice Exercises

1. Modify the Python code to output the final values of $w$ and $b$.
2. Change learning rate to 0.01 — what happens to training?
3. Add a second feature (e.g., bedrooms) and extend the code to handle multiple inputs.
