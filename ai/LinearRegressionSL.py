from sklearn.linear_model import LinearRegression
import numpy as np

X = np.array([
	[50, 1],
	[60, 2],
	[70, 3],
	[80, 4],
	[90, 5]
])
y = np.array([150, 180, 200, 220, 240])

sk = LinearRegression().fit(X, y)
print("w:", sk.coef_, "b:", sk.intercept_)
print("Prediction for [100, 6]:", sk.predict([[100, 6]])[0])