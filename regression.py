import numpy as np
from sklearn.linear_model import LinearRegression

# weighted edc ranks
# order is all 5 blackscholes, 5 simulation swaptions
x = np.array([1.0066309614894158, 1.0055556673460333, 1.0051133439924134, 1.0051117975739818, 1.0051114571891115,
              0.9651996786779897, 0.9645772649320558, 0.9643835193539171, 0.9643831825111079, 0.9643542539879645]).reshape((-1, 1))
y = np.array([0.5, 0.3, 0.45, 0.35, 0.5, 6.25, 4.2, 4.25, 2.8, 4.65])

# create linear regression model
model = LinearRegression().fit(x, y)
print("Model created")
regression_score = model.score(x, y)
print("Coeffecient of determination: ", regression_score)

# testing model using 5 other swaptions inputs and knn
test_inputs = np.array([0.9643785420973076, 0.9643881735147156, 0.9643881735147156, 
                      0.964383469184244, 0.9644675347308421, 0.9305050963822978]).reshape((-1, 1))
expected = np.array([5.25, 4.35, 3.95, 4.8, 3.7, 0.2])

# predict with model
prediction = model.predict(test_inputs)
print("Predicted: ", prediction)
