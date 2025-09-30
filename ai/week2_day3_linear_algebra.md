# 📘 Week 2 Day 3 (Study — Python)

## Topic: Linear Algebra Refresher for ML

### 1. Why Linear Algebra Matters in ML
Most ML algorithms (regression, neural networks, PCA, embeddings) rely heavily on **vectors and matrices**. Understanding these basics is critical to implement and optimize models.

---

### 2. Vectors
- **Definition:** An ordered list of numbers, e.g.  
  \[
  \mathbf{v} = \begin{bmatrix} 2 \\ 5 \\ -3 \end{bmatrix}
  \]  
- **Operations:**
  - Addition: \(\mathbf{v} + \mathbf{w} = [v_1+w_1, v_2+w_2, \dots]\)
  - Scalar multiplication: \(c \cdot \mathbf{v} = [c v_1, c v_2, \dots]\)

**Example:**  
\(\mathbf{v} = [2,3], \mathbf{w} = [1,4]\)  
\(\mathbf{v} + \mathbf{w} = [3,7]\)

---

### 3. Matrices
- **Definition:** A rectangular array of numbers.  
  \[
  A = \begin{bmatrix} 
  1 & 2 \\ 
  3 & 4 \\ 
  5 & 6 
  \end{bmatrix}
  \]  
- **Matrix-vector multiplication:**  
  \( A \cdot \mathbf{x} \)  
  Example:  
  \( A = \begin{bmatrix} 1 & 2 \\ 3 & 4 \end{bmatrix}, \mathbf{x} = \begin{bmatrix} 2 \\ 1 \end{bmatrix} \)  
  \( A\mathbf{x} = \begin{bmatrix} 1*2 + 2*1 \\ 3*2 + 4*1 \end{bmatrix} = \begin{bmatrix} 4 \\ 10 \end{bmatrix} \)

---

### 4. Dot Product
- **Definition:**  
  \(\mathbf{u} \cdot \mathbf{v} = \sum_{i=1}^n u_i v_i\)  
- **Geometric meaning:** Measures similarity (cosine of angle between vectors).  
- **Example:**  
  \(\mathbf{u} = [1,2,3], \mathbf{v} = [4,5,6]\)  
  Dot product = \(1*4 + 2*5 + 3*6 = 32\)

---

### 5. Norms (Vector Lengths)
- **L2 norm (Euclidean distance):**  
  \(\|\mathbf{v}\|_2 = \sqrt{\sum v_i^2}\)  
- **Example:** \(\mathbf{v} = [3,4]\),  
  \(\|\mathbf{v}\|_2 = \sqrt{3^2+4^2} = 5\)

---

### 6. Why ML Needs This
- **Linear Regression:** Predictions = \(X \beta\) (matrix-vector multiplication).
- **Neural Networks:** Each layer is essentially matrix multiplications + nonlinear functions.
- **Similarity Search:** Dot products & norms help in embeddings.

---

### 7. Python Code Example
```python
import numpy as np

# Define vectors and matrices
v = np.array([2, 3])
w = np.array([1, 4])
A = np.array([[1, 2],
              [3, 4]])

# Operations
print("Vector addition:", v + w)
print("Dot product:", np.dot(v, w))
print("Matrix-vector product:", A.dot(v))
print("Norm of v:", np.linalg.norm(v))
```

**Output:**
```
Vector addition: [3 7]
Dot product: 14
Matrix-vector product: [ 8 18]
Norm of v: 3.605551275463989
```

---

### 8. Complexity
- **Vector addition:** \(O(n)\)  
- **Dot product:** \(O(n)\)  
- **Matrix-vector multiplication:** \(O(mn)\) for \(m \times n\) matrix  

---

✅ By the end of today, you should:
- Understand vectors, matrices, dot products, and norms.
- Apply them in Python with NumPy.
- Recognize their role in ML models.
