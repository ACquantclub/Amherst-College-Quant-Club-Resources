# Solution 1
### The question asks the probability of getting exactly 500 out of 1000 coin flips as heads within 5% without using a calculator
Solution:
Use the binomial formula, $(\frac{n!}{k!-(n-k)!}) * p^k * (1-p)^{n-k}$
$(\frac{1000!}{500!-500!}) * (\frac{1}{2})^500 * (\frac{1}{2})^500$

```python
import random
```
