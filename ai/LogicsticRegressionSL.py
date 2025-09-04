import numpy as np
from sklearn.linear_model import LogisticRegression

# Example dataset (hours studied → pass/fail)
X = np.array([
    [2, 5],
    [4, 6],
    [6, 8],
    [8, 8]
])   # features
y = np.array([0, 0, 1, 1])           # labels

# Create and train model
model = LogisticRegression()
model.fit(X, y)

# Parameters
print("Weight:", model.coef_)
print("Bias:", model.intercept_)

# Predict probability for a student who studied 5 hours
new_hours = np.array([[5, 7]])
prob = model.predict_proba(new_hours)
print("Predicted probability of passing:", prob)
