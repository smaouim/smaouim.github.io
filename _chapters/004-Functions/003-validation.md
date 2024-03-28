---
title: Validating, importing, documenting 
slug: validation
abstract: Organizing code into modules and documenting it
---

## Validating function arguments types and values

**Question**: _should a function check if its arguments are valid (type and value), similarly to program input?_


* Common programming styles:
  * [EAFP](https://docs.python.org/3/glossary.html#term-EAFP): Easier to Ask for Forgiveness than Permission
    * Assumes the existence of valid keys or attributes and catches exceptions if the assumption proves false.
    * In Python, this clean and fast style is characterized by the presence of `try` and  `except` statements.
  * [LBYL](https://docs.python.org/3/glossary.html#term-LBYL): Look before You Leap
    * Tests for pre-conditions before making calls or  lookups thus  characterized by the presence of many `if` statements.
    * In Python, it would use function like `isinstance()` to check for type.

### Python programming style: duck-typing

* Python does not enforce type matching prior to runtime
* It does not look at an object's type to determine if it has the right interface
* The operation, method or attribute is simply called or used: If it looks like a duck and quacks like a duck, it must be a duck (even if it's not)
* Avoids tests using `type()` or  `isinstance()` for function arguments i.e. typically follows _**EAFP**_ programming.
  * _**LBYL**_ is only necessary in situations like program interface, command-line arguments, etc.
* At a function call, programmer typically knows the expected argument type(s) from the documentation
  * if a runtime exception is raised due to wrong argument type, programmer just fixes the function call or otherwise handles the exception based on application needs
* Checking whether argument value is in a certain range is sometimes necessary for computation correctness.
  * Handling out-of-range arguments could be by returning special values or by raising exceptions (for instance `ValueError`)

#### The `typing` module

* The `typing` module offers support for type hints
* These are hints and are not enforced and have no effect on runtime
  * used by third party tools such as type checkers, IDEs, linkers, etc.

##### Example:

Note below that even though the hint specifies that the argument should be of type `str`, the program runs without errors, even when it calls the function with a `list` argument.

{% JDoodle %}
def strReverse(s : str) -> str:
    return s[::-1]

print(strReverse("Hello world"))
print(strReverse([1, 2, 3]))
print(strReverse(10))
{% endJDoodle %}


## Code organization into modules

* _**Code reuse**_ is one major pillar of programming: every programmer cannot write everything from scratch
  * Useful code is distributed by individuals and companies for free or for a fee for other programmers to reuse
* As computational problems become longer and more complex, programmers need to:
  * Separate code into multiple files, to get shorter and manageable units
  * Use code written by other people, AKA libraries, including commonly used / standard functionalities, distributed with Python (standard library)
* Python code is written into _**modules**_; to use a module, you need to `import` it

##### Examples:

{% JDoodle %}
def addTwo(a, b):
    return a+b


def multTwo(a, b):
    return a*b


var = addTwo(2, 6)
print(addTwo(1, 10))
print(multTwo(3, 8))

{% endJDoodle %}

{% JDoodle %}
from UsefulModule1 import *
from UsefulModule2 import foo

print(addTwo(3, 4))
print(multTwo(2, 7))
foo()
{% endJDoodle %}

{% JDoodle %}
from UsefulModule1 import *
from UsefulModule2 import foo

print(addTwo(3, 4))
print(multTwo(2, 7))
foo()
{% endJDoodle %}

{% JDoodle %}
import math
import UsefulModule1

print(UsefulModule1.addTwo(3, 4))
print(UsefulModule1.multTwo(2, 7))
print(UsefulModule1.var)
print(math.factorial(3))
print(math.sqrt(25))


{% endJDoodle %}

{% JDoodle %}
from UsefulModule1 import *

print(addTwo(3, 4))

from UsefulModule2 import *

print(addTwo(3, 4))
print(multTwo(2, 7))
foo()
{% endJDoodle %}


## The "main" function

* Unlike other programming languages, no "main" function is required
  * "Application code" is typically defined as a script, directly in the module's scope.
* It is optionally defined, to allow a module's functions (and classes) to be imported into other modules, without including the "Application code" (script).
* The "Application code" should execute, only when that application's module is being run:
  * This behavior can be achieved just by writing the "Application code" under the condition `if __name__ == "__main__"`:
  * The common practice is to write the "Application code" into a function called `main` and call it under the condition `if __name__ == "__main__":`;
  * Naming the function `main` is also just a convention; other names like `script`, or `app` can be used as well.
* `__name__` is a module attribute (default variable) set by the runtime to `"__main__"` when the module is being executed and set to the module's name when it is imported.

{% JDoodle %}
def addTwo(a, b):
    return a+b


def multTwo(a, b):
    return a*b


def main():
    var = addTwo(2, 6)
    print(addTwo(1, 10))
    print(multTwo(3, 8))


if __name__ == "__main__":
    print(__name__)
    main()  #  main script can be defined in a function and the function called under this condition

# can also be written as
# if __name__ == "__main__":
#     var = addTwo(2, 6)
#     print(addTwo(1, 10))
#     print(multTwo(3, 8))
{% endJDoodle %}


{% JDoodle %}
import UsefulModule3 as um3

print(um3.addTwo(3, 4))
print(um3.multTwo(2, 7))
print(__name__)
print(um3.__name__)

{% endJDoodle %}

{% JDoodle %}
from UsefulModule3 import *

print(addTwo(3, 4))
print(multTwo(2, 7))

{% endJDoodle %}


## Code documentation via `docstrings`

* Python enables automatic code documentation via `docstrings`
* A string literal which appears as the first expression in a function, class or module
* Ignored when the script is executed but saved into the `__doc__` attribute of the enclosing function/class/module
* Different from comments
* Can be accessed via the function/class/module `__doc__` attribute or by calling the `help()` function
* Can be single line or multi-line
  * For multi-line, better follow some standard convention like the one specified in [PEP 257](https://peps.python.org/pep-0257/) document

{% JDoodle %}
"""Simple module used to illustrate the use of docstrings """


def addTwo(a, b):
    """Takes in two numbers, returns their sum"""
    return a+b


def multTwo(a, b):
    """Takes in two numbers, returns their product"""
    return a*b


if __name__ == "__main__":
    print(addTwo.__doc__)
    print(__doc__)

{% endJDoodle %}

{% JDoodle %}
def addTwo(a, b):
    return a+b


def multTwo(a, b):
    return a*b

if __name__ == "__main__":
    print(addTwo.__doc__)
    print(__doc__)

{% endJDoodle %}

{% JDoodle %}
import DocstringExample as ds

#print(ds.__doc__)
help(ds.addTwo)
help(ds)

{% endJDoodle %}


### Other function features:

* Many other interesting function features:
  * Keyword argument passing
  * Default values
  * Variable number of parameters
  * Dictionary parameter passing
* Read about them in sections 5.11 to 5.14 of [Python Programming Fundamentals, Kent D. Lee.](https://link.springer.com/chapter/10.1007/978-1-84996-537-8_5)
  * Reading the whole chapter is a very good idea too

## Practice:

* In the template below, you will find a structured program that computes the digital roots of a user-prompted list of positive integers
* Rewrite the application script into a main function
* Add docstrings to the module and the functions
* Write another module where you use the `sumOfDigits` function from this module to compute the sum of digits for the elements of user-prompted list of positive integers
  * You can also use the function `get_integer_list` for getting the input list

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
    print(f"The digital root of {number} is {digitalRoot(number)}.")

{% endJDoodle %}


{% Solution %}
{% JDoodle %}
"""docstring of the module"""


def sumOfDigits(x):
    """sums up the digits of the argument integer"""
    absx = abs(x)
    sumDig = 0
    for c in str(absx):
        sumDig += int(c)
    return sumDig


def digitalRoot(x):
    """computes the digital root of the argument integer"""
    digRt = abs(x)
    while digRt > 9:
        digRt = sumOfDigits(digRt)
    return digRt


def get_integer_list():
    """prompts the user for and returns a list of integers"""
    userInput = input("Please enter space separated integer values: ")
    userInput = userInput.split()
    intList = []
    for s in userInput:
        try:
            intList.append(int(s))
        except ValueError:
            continue
    return intList


def main():
    """Computes the digital root of the numbers entered at the prompt"""
    print("This program computes the digital root of the numbers entered at the prompt")
    numbers = get_integer_list()
    for number in numbers:        
        print(f"The digital root of {number} is {digitalRoot(number)}.")


if __name__ == "__main__":
    main()
{% endJDoodle %}

{% JDoodle %}
import digitalRoot as dr

numbers = dr.get_integer_list()
for n in numbers:
    print(f"The sum of digits of {n} is {dr.sumOfDigits(n)}")
{% endJDoodle %}
{% endSolution %}
