import numpy as np

# Sigmoid function
def sigmoid(z):
    return 1 / (1 + np.exp(-z))

# Feature scaling (standardization)
def standardize(X):
    mean = X.mean(axis=0)
    std = X.std(axis=0)
    return (X - mean) / std, mean, std

# Logistic Regression training (gradient descent) with L2 regularization
def train_logistic_regression(X, y, lr=0.01, epochs=1000, reg_lambda=1.0):
    m, n = X.shape
    w = np.zeros(n)
    b = 0

    for _ in range(epochs):
        z = np.dot(X, w) + b
        y_hat = sigmoid(z)

        # Compute gradients (with L2 regularization)
        dw = (1/m) * np.dot(X.T, (y_hat - y)) + (reg_lambda / m) * w
        db = (1/m) * np.sum(y_hat - y)

        # Update parameters
        w -= lr * dw
        b -= lr * db
    
    return w, b

# Example dataset (multiple features: [hours studied, hours slept] → pass/fail)
X = np.array([
    [2, 5],
    [4, 6],
    [6, 8],
    [8, 8]
])   # features
y = np.array([0, 0, 1, 1])           # labels

# Standardize features
X_scaled, mean, std = standardize(X)

# Train with L2 regularization (lambda=1.0 for closer match to sklearn default)
w, b = train_logistic_regression(X_scaled, y, reg_lambda=1.0, epochs=10000, lr=0.1)
print("Trained weights:", w, "bias:", b)

# Predict probability for a student who studied 5 hours and slept 7 hours
new_sample = np.array([5, 7])
new_sample_scaled = (new_sample - mean) / std
prob = sigmoid(np.dot(new_sample_scaled, w) + b)
print("Predicted probability of passing:", prob)
