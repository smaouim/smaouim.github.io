---
title: Basic built-in data types
slug: types
abstract: "Integer, floating points and strings: objects, operations and expressions."
---

## Arithmetic expressions

* Write a program that displays your name in the console
* Solving computational problems (even the simplest) requires performing arithmetic computation using the input data, constant values and more
* An arithmetic expression is a combination of arithmetic operators (+, -, /, etc.) and numerical operands used to perform such computations
* An expression is evaluated at execution time and its result assigned to a variable, printed, etc. depending on the statement it appears in
* Operands can be literal numeric values or variables of type `int` or `float`

![](assets/images/Lec2-2.png)

* Expressions can have mixed types operands (some `int` and some `float`); they are evaluated using float arithmetic and the result is always a float
  * Check the behavior of floor division with floats
* Conversion from floating point to integer via truncation of decimal part
* Conversion from integer to floating point by adding a 0 decimal part
* Conversion operators within expressions produce operands in the intended data type but do not alter the object’s original type
  * Try expressions that combine conversion and arithmetic operators
* Arithmetic operators precedence is similar to that of calculators including parentheses
* More advanced mathematical operations and functions (square root, trigonometric, etc.) require invoking the math library (to be discussed later)

Run the code below to check the behavior of the above operators:

<div data-pym-src="https://www.jdoodle.com/plugin"
data-language="python3"  data-version-index="3.11.5" data-libs="">
x = 22.4
y = 5.1
print("x = ", x)
print("y = ", y)
print("Operations on floats ...")
print("x+y = ", x + y)
print("x-y = ", x - y)
print("x*y = ", x * y)
print("x/y = ", x / y)
print("x//y = ", x // y)
print("x%y = ", x % y)  # meaningless
print("x**y = ", x ** y)
print("int(x) = ", int(x))
print("x is still ", x)
print("Converting and overwriting ...")
x = int(x)
y = int(y)
print("x = ", x)
print("y = ", y)
print('Operations of ints ...')
print("x+y = ", x + y)
print("x-y = ", x - y)
print("x*y = ", x * y)
print("x/y = ", x / y)
print("x//y = ", x // y)
print("x%y = ", x % y)
print("x**y = ", x ** y)

print("converting to float without overwriting")
print("float(x) = ", float(x))
print("float(y) = ", float(y))

print("rounding")
x = 10
y = 3
print("x = ", x)
print("y = ", y)
print("x / y = ", x / y)
print("round(x / y) = ", round(x / y))
print("round(x / y, 2) = ", round(x / y, 2))
</div>

## Exercise: hypotenuse

* Write a short program that computes the length of the hypotenuse of a right triangle given the two legs. The program should:
  * initializes two variables `sideA` , `sideB` with the lengths of the two legs of a right triangle 
  * using the Pythagorean theorem, computes the length of the hypotenuse of the triangle and stores it in a variable `sideC` 
  * prints the result
* Notes:
  * The Pythagorean theorem states that the sum of the squares of the two legs of the triangle equals the square of the hypotenuse.
  * You can obtain the square root by raising to the power 0.5
  * Try values 6 and 8 for `sideA` and `sideB`
  * Try floating point values like 2.6 and 3.1


<div data-pym-src="https://www.jdoodle.com/plugin"
data-language="python3"  data-version-index="3.11.5" data-libs="">

</div>



<details>
  <summary><i class="fa fa-lightbulb-o" aria-hidden="true"></i> Solution</summary>

  <div data-pym-src="https://www.jdoodle.com/plugin"
    data-language="python3"  data-version-index="3.11.5" data-libs="">
    sideA = 4
    sideB = 3
    sideC = (sideA ** 2 + sideB ** 2) ** 0.5
    print(sideC)
  </div>
</details>

## Exercise: weight conversion

* Write a program which:
  * Initializes a **float** variable `Kg` with a value corresponding to a weight in Kilograms
  * computes the equivalent weight in pounds and ounces and stores the result in two **integer** variables `Lb` and `Oz`
  * print the result following the example below

  ```
  2.89  Kg =  6  Lbs and  5  Oz
  ```
* Notes:
  * 1 Lb = 453.592 g = 0.453592 kg
  * 1 Oz = 28.3495 g = 0.0283495 kg
  * The number of ounces is the number of whole ounces remaining after counting the number of whole pounds. It must be less than the number of ounces in a pound i.e. less than 16.
    * e.g: 0.9 Kg = 1 Lbs and 15 Oz and 0.91 Kg = 2 Lbs and 0 Oz