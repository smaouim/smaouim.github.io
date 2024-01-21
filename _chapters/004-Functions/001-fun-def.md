---
title: Defining functions
slug: fun-def
abstract:
---

## Functions in mathematics

* Example: 

$$
\begin{aligned}
g: \mathbb{R} \to \mathbb{R} \ ;\\
x \mapsto x^2 + 4x - 3
\end{aligned}
$$

* $g$ maps values from the  domain $\mathbb{R}$ to values in the range $\mathbb{R}$ using an arithmetic expression
  * Domains can vary, e.g. $\mathbb{N}, \mathbb{Q}, \mathbb{C}, \mathbb{R}^2, \mathbb{R}\times\mathbb{N}, ...$
  * Ranges can vary similarly
  * Expressions can be conditional, e.g. 
  
$$
\begin{aligned}
h: \mathbb{N} \to \mathbb{N} ;\\ n \mapsto \left\{\begin{matrix} \frac{n}{2} & if\ n\ is\ even\\ n-1 & if\ n\ is\ odd \\\end{matrix}\right.
\end{aligned}
$$

## Functions in Python

* Set of statements grouped under one identifier
* A function can be applied on values in a certain _domain_: **argument**
* A function **returns** (produces) a value in a certain _range_

Additionally:

* Any statement can be in a function, so functions can have "side-effects" like printing a message, modifying an object, writing a file, etc.
  * As a consequence, a function may not take an argument or return a value and just have some "side-effect"
* Functions can contain conditionals, loops and more
* Functions can **take multiple arguments** and **return multiple values**, all of which of any type: `int`, `float`, `string`, `tuple`, `list`, etc.


### Defining a function

Defining a function is specifying:

* An **identifier** i.e. a function name that should express what the function is about
* Formal **parameters** i.e. a set of variables listed between ()  used to **store** the values on which the function will operate (**arguments**)
* **Body** i.e. the set of statements the perform the required computation

### Calling a function

* A function can only be called if it was defined previously in the code
* Calling a function is applying the function name to some arguments and using the result in a statement
* The argument can be a literal or can be the value of some existing variable
* In programs we've written so far, we've been calling many built-in functions like `abs()`, `range()`, `len()`, `print()`, …
  * _The code for the definitions of these functions is in the standard library part of the Python distribution_
* When a function returns a value, the function call can be used in an expression, an assignment or as another function argument
  * **The function call evaluates to an object of the same type and value as the one returned**
* A function may not return a value but can perform operations like printing, modifying files, etc.
* When a function does not return a value, the calling code should not try to use it in an expression, assignment or as another function argument
  * _The function call evaluates to `None`_
  * _Using `None`  in an expression or as a function argument can generate exceptions_
* A function can both return a value and perform operations like printing or writing files: it can be called either way depending on the intended use in the calling code


### Examples:

Code for functions computing the $g$ and $h$ examples above.

The code for $h$ contains additionally a side-effect, here printing a message about the parity of the argument $n$.

{% JDoodle %}
def g(x):
    y = x**2 + 4 * x - 3
    return y

def h(n):
    if n % 2 != 0:
        print(n, "is odd")
        return n-1
    print(n, "is even")
    return n//2

# calling the function g
print("begin here")
g(1)
print(f"g(1) = {g(1)}")
y = 3.2
print(f"g({y}) = {g(y)}")

z = h(21)
print(f"h(20) = {h(20)}")

{% endJDoodle %}


## Why functions?

* Functions are code-organization constructs
* To avoid repeating/copying/rewriting **similar** sets of statements in the same code
  * Helps with code maintenance
* Reduce the size (number of statements) of the script
  * Shorter means easier to understand
  * Script becomes a sequence of "macro steps"; hiding the detailed operations in the functions
* And many more benefits …
* Good reading: [Chapter 5, Python programming fundamentals, Kent D. Lee](https://link.springer.com/chapter/10.1007/978-1-84996-537-8_5#Sec1)
  

## Practice:

1. Write a function `sum_digits`, which computes and returns the sum of digits of an integer number. Negative integers should have the same sum of digits as their absolute value.
2. To test this function, write a script in the same module (file), which:
   * prompts the user for an integer; terminate if the input is invalid
   * print its sum of digits, computed by calling the function
3. Write a second function `digital_root`, which computes and returns the digital root of an integer number
   * The digital root is defined as the result of summing the digits repeatedly until only a single digit remains. Negative integers should have the same digital root as their absolute value.
   * e.g. the digital root of the number 12345:
     * 12345 : sum of digits →15 : sum of digits → 6 : one digit → digital root = 6
     * To perform sum-of-digits operation, call the function previously implemented
4.  Change the script to print the digital root of the input number, instead of the sum of digits.
5.  Change the script to prompt for a space-separated sequence of integers then print their digital root
    * ignore non-integer entries
    * print one line for each integer n in the form: `digital root(n) =`
6.  Modify your code by defining then calling a function `get_integer_list`, which prompts for, acquires and validates the input and returns a list of the user integer entries


{% empty_jdoodle %}

{% Solution %}
Step 1-2
{% JDoodle %}
def sumOfDigits(x):
    absx = abs(x)
    sumDig = 0
    for c in str(absx):
        sumDig += int(c)
    return sumDig


print("This program computes the sum of digits of the number entered at the prompt")
try:
    intEntry = int(input("Please enter an integer number: "))
    sDigits = sumOfDigits(intEntry)
    print(f"The sum of digits of {intEntry} is {sDigits}.")
except ValueError:
    print("Not an integer")
{% endJDoodle %}

Step 3-4
{% JDoodle %}
def sumOfDigits(x):
    absx = abs(x)
    sumDig = 0
    for c in str(absx):
        sumDig += int(c)
    return sumDig


def digitalRoot(x):
    digRt = abs(x)
    while digRt > 9:
        digRt = sumOfDigits(digRt)
    return digRt


print("This program computes the digital root of the number entered at the prompt")
try:
    intEntry = int(input("Please enter an integer number: "))
    dRoot = digitalRoot(intEntry)
    print(f"The digital root of {intEntry} is {dRoot}.")
except ValueError:
    print("Not an integer")
{% endJDoodle %}

Step 5
{% JDoodle %}
def sumOfDigits(x):
    absx = abs(x)
    sumDig = 0
    for c in str(absx):
        sumDig += int(c)
    return sumDig


def digitalRoot(x):
    digRt = abs(x)
    while digRt > 9:
        digRt = sumOfDigits(digRt)
    return digRt


print("This program computes the digital root of the numbers entered at the prompt")

userInput = input("Please enter space separated integer values: ")
userInput = userInput.split()
intList = []
for s in userInput:
    try:
        intList.append(int(s))
    except ValueError:
        continue

for number in intList:  
    dRoot = digitalRoot(number)      
    print(f"The digital root of {number} is {dRoot}.")

{% endJDoodle %}

Step 6
{% JDoodle %}
def sumOfDigits(x):
    absx = abs(x)
    sumDig = 0
    for c in str(absx):
        sumDig += int(c)
    return sumDig


def digitalRoot(x):
    digRt = abs(x)
    while digRt > 9:
        digRt = sumOfDigits(digRt)
    return digRt


def get_integer_list():
    userInput = input("Please enter space separated integer values: ")
    userInput = userInput.split()
    intList = []
    for s in userInput:
        try:
            intList.append(int(s))
        except ValueError:
            continue
    return intList


print("This program computes the digital root of the numbers entered at the prompt")
numbers = get_integer_list()
for number in numbers:
    dRoot = digitalRoot(number)       
    print(f"The digital root of {number} is {dRoot}.")

{% endJDoodle %}
{% endSolution %}

