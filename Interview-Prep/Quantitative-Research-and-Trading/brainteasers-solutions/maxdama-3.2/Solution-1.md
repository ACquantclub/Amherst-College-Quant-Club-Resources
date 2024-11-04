# Solution 1
### The question asks the probability of getting exactly 500 out of 1000 coin flips as heads within 5% without using a calculator
Solution:
Use the binomial formula, $\left(\frac{n!}{k!-(n-k)!}\right) * p^k * (1-p)^{n-k}$

$\left(\frac{1000!}{500!-500!}\right) * \left(\frac{1}{2}\right)^{500} * \left(\frac{1}{2}\right)^{500}$

$\left(\frac{1000!}{500!-500!}\right) * \left(\frac{1}{2}\right)^{1000} $

To approximate factorials you can use Stirling's approximation
$n! ≈ \sqrt{2πn} \left(\frac{n}{e}\right)^n$

plugging that in

$≈ \frac{ \sqrt{2π(1000)} 1000^{1000} e^{500} e^ {500}}{\sqrt{2π(500)2π(500)} 500^{500} 500^{500} e^ {1000}} $

$= \frac{1}{\sqrt{500π}$

$= \frac{1}{1\sqrt{5π}$
then 
$\frac{\sqrt{10}{1\sqrt{15.7}$

$\frac{\sqrt{10}{1\sqrt{15.7} ≈ 0.1$ 

```python
import random
```
