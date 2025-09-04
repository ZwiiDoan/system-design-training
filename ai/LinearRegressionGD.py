import numpy as np

class LinearRegressionGD:
    def __init__(self, lr=1e-4, epochs=1000):
        self.lr = lr
        self.epochs = epochs
        self.w = None  # Will be initialized based on number of features
        self.b = 0.0

    def fit(self, X, y):
        X = np.asarray(X, dtype=float)
        y = np.asarray(y, dtype=float)
        if X.ndim == 1:
            X = X.reshape(-1, 1)
        m, n = X.shape
        if self.w is None:
            self.w = np.zeros(n)
        for _ in range(self.epochs):
            y_hat = X @ self.w + self.b  # shape (m,)
            error = y_hat - y  # shape (m,)
            dw = (2.0 / m) * (X.T @ error)  # shape (n,)
            db = (2.0 / m) * error.sum()
            self.w -= self.lr * dw
            self.b -= self.lr * db
        return self

    def predict(self, X):
        X = np.asarray(X, dtype=float)
        if X.ndim == 1:
            X = X.reshape(-1, len(self.w))
        return X @ self.w + self.b

# Example usage
if __name__ == "__main__":
    # Example with multiple features
    X = np.array([
        [50, 1],
        [60, 2],
        [70, 3],
        [80, 4],
        [90, 5]
    ])
    y = np.array([150, 180, 200, 220, 240])

    model = LinearRegressionGD(lr=1e-4, epochs=10000).fit(X, y)
    print("w:", model.w, "b:", model.b)
    print("Prediction for [100, 6]:", model.predict([100, 6]))