### Solution 1

The question asks for the probability of getting exactly 500 heads out of 1000 coin flips, within 5%, without using a calculator.

**Solution:**  
Use the binomial formula:

$P(X = k) = \binom{n}{k} p^k (1-p)^{n-k}$

For our case:


$P(X = 500) = \binom{1000}{500} \left(\frac{1}{2}\right)^{500} \left(\frac{1}{2}\right)^{500}$

This simplifies to:

$= \binom{1000}{500} \left(\frac{1}{2}\right)^{1000}$

To approximate factorials, we can use Stirling's approximation:

$n! \approx \sqrt{2 \pi n} \left(\frac{n}{e}\right)^n$

Plugging this into the formula:

$\approx \frac{\sqrt{2 \pi (1000)} \left(1000\right)^{1000} e^{-1000}}{\sqrt{2 \pi (500) \cdot 2 \pi (500)} \left(500\right)^{500} \left(500\right)^{500} e^{-1000}}$

This further simplifies to:

$= \frac{1}{\sqrt{500 \pi}}$

$\approx \frac{1}{\sqrt{5 \pi}}$

Which then approximates to:

$\approx \frac{\sqrt{10}}{\sqrt{15.7}}$

Finally,

$\approx 0.1$

Here’s the Python code to simulate the problem:

```python
import random
``` 
