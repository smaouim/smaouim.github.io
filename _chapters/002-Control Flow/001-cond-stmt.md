---
title: Conditional statements 
slug: cond 
abstract: Boolean expressions as conditions for the multiple variations of conditional statements
---

## Input validation

* Usually an algorithm works on some specific input type and range of values

* If the prompt is not specific enough or the user is careless or malicious, his/her input may be of the wrong type or in the wrong range of values

* The output then would be wrong or the program can error-out

* Input validation is testing whether the input is in the right format and range

    * important part of a program to avoid malfunction

* Based on input validity test , the program decides or chooses to solve the program or handle the wrong input

## Making choices or decisions

* Making choices is essential for more than just validating input

* Many algorithms require making decisions or executing steps based on the verification of some condition

* Most of the time, conditions are Boolean expressions involving variables which value is only known at execution time

* A Boolean expression evaluates to True or False E.g. comparison expressions

## Comparison operators
![](assets/images/Lec4-1.png)

{% JDoodle %}
A = True
print("A=", A)
userEntry = int(input("Please enter an integer: "))
print(userEntry, "> 14 ? =>", userEntry > 14)
B = (userEntry % 7) == 0
print("B=", B)
{% endJDoodle %}

* In the statement `A = True`, the variable A has a Boolean type

* The expression, `userEntry > 14` evaluates to a Boolean. it is printed as:

    * True, if `userEntry` is greater than 14

    * False, if `userEntry` is less or equal to 14

* In the statement, `B = (userEntry % 7) == 0`, the variable B also has a Boolean type, outcome of a comparison expression

* B is True, if `userEntry` is a multiple of 7.

* B is false if `userEntry` is not a multiple of 7

## Making a choice with the if statement

* An if construct evaluates a condition (Boolean variable or expression) and allows to specify a set of statements to be executed when the condition evaluates to True.

![](assets/images/Lec4-2.png)

* An  optional  companion `else` construct specifies another set of statements to be executed when it evaluates to False

![](assets/images/Lec4-3.png)

## `if` statement syntax

```
<statements before if statement>
 if <condition >:
    <then statements >
<statements after if statement >
```
* Here, `<then statements>` are executed if the condition is `True` and skipped if it is `False`

Besides, `<then statements>` **must be indented**
```
<statements before if statement >
 if   <condition >:
    <then statements >
 else: 
    <else statements >
<statements after if statement >
```
* Here, `<then statements>` are executed if the condition is `True` and the `<else statements>` are executed if it is `False`

* Besides, `<then statements>` and `<else statements>` must be  indented

### Examples
{% JDoodle %}
userEntry = int(input("Please enter an integer:"))
if userEntry >= 0:
  print("positive")
else:
  print("negative")
print(2 * userEntry)
{% endJDoodle %}

## Exercise: roots of a quadratic polynomial
Write a program which

* prompts the user for the coefficients of a quadratic equation
* computes and prints its real roots, if they exist. If real roots don’t exist print a message.

If we denote by

* a : the coefficient of the quadratic term
* b : the coefficient of the linear term
* c : the coefficient of constant term

Then, the roots are computed as:
$$
x_1 = \frac{-b-\sqrt{b^2-4ac}}{2a}
$$
and
$$
x_2=\frac{-b+\sqrt{b^2-4ac}}{2a}
$$

Real roots exist if the discriminant $b^2-4ac$ is greater or equal to 0.

* Note: the case where discriminant is equal to 0 will simply result in the same value for both roots, and should not be treated differently.

{% empty_jdoodle %}

## Ternary operator

When there is only one expression to select on a `True` condition or a `False` condition, it is possible to express the same logic of the `if` statement using the ternary operator

```
<statements before conditional statement >
<then statement> if   <condition> else <else statement>
<statements after conditional statement >
```

{% JDoodle %}
userEntry = int(input("Please enter an integer:"))
print("positive") if userEntry >= 0 else print("negative")
# similarly
print("positive" if userEntry >= 0 else "negative")
{% endJDoodle %}

## Problem: maximum of three values

Consider a program which

* prompts the user for three integer values x, y, and z

* finds and prints the maximum out of the three values

Solving this problem requires a logic that cannot be expressed with a single if statement and a single simple comparison, since two conditions have to be verified.

## Nested if statements

* The simplistic approach to solve the “maximum of three” problem is to use *nested* `if` statements

* Many times nested `if` statements are inherent of the algorithm and cannot be avoided

* Many other times it is possible to avoid nested statements *algorithmically* or/and *syntactically* (like in this max of three example)

![](assets/images/Lec4-4.png)

Let's start with nested if statements conditions

{% JDoodle %}
# get the user input
print("This program finds the maximum of three integers")
x = int(input("Please provide the first integer: "))
y = int(input("Please provide the second integer: "))
z = int(input("Please provide the third integer: "))
# find and print the maximum of the three input values
{% endJDoodle %}

## Choosing from a list of alternatives

Consider a program which:

* prompts the user for two numeric operands and an operation symbol

* prints the operation and its result

The program reads the operation symbol as a string then determines the expression to be evaluated based on the value of that symbol string.

Assuming that the program allows only the basic operations +, -, * and /, the program has to compare the input symbol, potentially, against all these symbols.

### With nested if statements
{% JDoodle %}
print("This program is a basic calculator (performs a two-operand arithmetic operation)")
x = float(input("Please enter the first operand: "))
op = input("Please enter the operation symbol (+ or - or * or /):")
y = float(input("Please enter the second operand: "))

if op == '+':
  print(x, op, y, "=", x+y)
else:
  if op == '-':
    print(x, op, y, "=", x-y)
  else:
    if op == '*':
      print(x, op, y, "=", x*y)
    else:
      if op == '/':
        print(x, op, y, "=", x/y)
      else:
        print("Not a valid operation")
{% endJDoodle %}

### With `elif` construct
{% JDoodle %}
print("This program is a basic calculator (performs a two-operand arithmetic operation)")
x = float(input("Please enter the first operand: "))
op = input("Please enter the operation symbol (+ or - or * or /):")
y = float(input("Please enter the second operand: "))

if op == '+':
  print(x, op, y, "=", x+y)
elif op == '-':
  print(x, op, y, "=", x-y)
elif op == '*':
  print(x, op, y, "=", x*y)
elif op == '/':
  print(x, op, y, "=", x/y)
else:
  print("Not a valid operation")
{% endJDoodle %}

## Exercise: Club access eligibility

Write a program that checks if a person is eligible to enter a club based on her age. The person has to be between 15  and 18 years old (bounds included) to be eligible. The program

* prompts the user for the age

* prints either “eligible” or “not eligible”

Note: use simple comparison expressions and the `if-elif-else` constructs.

{% empty_jdoodle %}

## Compound Boolean expressions

* A Boolean expression is an expression that evaluates to a Boolean and has a Boolean type

* The simplest Boolean expressions are comparison expressions

* Any Boolean expression can be combined with another using the logical operators `and`, `or` and `not`.

* De Morgan's law:

  * `not (A and B) = (not A) or (not B)`

  * `not (A or B) = (not A) and (not B)`

### Solution to Club Eligibility with compound conditions
{% JDoodle %}
age = int(input("Please enter your age: "))

if age >= 15 and age <= 18:
  print("eligible")
else:
  print("not eligible")

# same as
if 15 <= age <= 18:
  print("eligible")
else:
  print("not eligible")

# in the following, the condition is the negation of the previous ones
#  so the "then" and "else" statements are inverted
if age < 15 or age > 18:
  print("not eligible")
else:
  print("eligible")
{% endJDoodle %}

## Maximum of three values with compound conditions and elif
{% empty_jdoodle %}

{% Solution %}
{% JDoodle %}
x = int(input("Please enter the first integer: "))
y = int(input("Please enter the second integer: "))
z = int(input("Please enter the third integer: "))

if x >= y and x >= z:
  print(x, "is the maximum")
elif y >= z:
  print(y, "is the maximum")
else:
  print(z, "is the maximum")

# other implementation (multiple prints in case of equality)
if x >= y and x >= z:
  print(x)
if y >= x and y >= z:
  print(y)
if z >= x and z >= y:
  print(z)

# the following is a (semantically) wrong code
# be careful of using non-boolean as operands to "and" and "or"
if x >= (y and z):  # correct syntax, wrong semantic
  print(x)
elif y >= z:
  print(y)
else:
  print(z)

{% endJDoodle %}
{% endSolution %}

## Short circuit logic

The second operand of a Boolean expression is not evaluated if:

* the operation is `and` and the first operand evaluates to `False` : the result is inevitably `False`

* the operation is `or` and the first operand evaluates to `True`: the result is inevitably `True`

{% JDoodle %}
numerator = int(input("Please enter the numerator:"))
denominator = int(input("Please enter the denominator: "))

# In the following if statement, the % operation is not executed,
# when the divisor (denominator) is found to be 0.
if denominator != 0 and numerator % denominator == 0:
  print("The numerator is evenly divided by the denominator.")
else:
  print("The fraction is not a whole number")
{% endJDoodle %}

## Non-Boolean expressions as conditions

* If a variable or expression of non-Boolean type is used as a conditional expression, it is expended to a Boolean expression that compares against the null value of the type: 0 for `int`, 0.0 for `float` and empty string for `string`

* However, operands for `and` and `or` operators must not be non-Boolean; 
  * logical operators always return one of their operands and always use short-circuit logic
  * syntactically, the expressions will be correct but may give a result different from what beginner programmers would have intended

{% JDoodle %}
x = 4
if x: # translates to if x != 0
  print("x is not null")
else:
  print("x is null")

y = 0
if not y: # translate to if not (y != 0) i.e. if y == 0
  print("y is null")
else:
  print("y is not null")

m = 2.5
if m:
  print("m is not null")
else:
  print("m is null")

n = 0.0
if n:
  print("n is not null")
else:
  print("n is null")

a = "False"
if a:
  print("a is not null")
else:
  print("a is null")

b = ""
if b:
  print("b is not null")
else:
  print("b is null")

# and and or short-circuit logic
print(2 and 3)     # returns 3      because it's the last operand evaluated to "true"
print(5 and 3)     # returns 3      because it's the last operand evaluated to "true"
print(0 and 3)     # returns 0      because it's the first operand evaluated to "false" and no need to check further
print(False and 3) # returns False  because it's the first operand evaluated to "false" and no need to check further
print(None and 3)  # returns None   because it's the first operand evaluated to "false" and no need to check further
print("" and 3)    # returns ""     because it's the first operand evaluated to "false" and no need to check further

print(2 or 3)     # returns 2  because it's the first operand evaluated to "true" and no need to check further
print(5 or 3)     # returns 5  because it's the first operand evaluated to "true" and no need to check further
print(0 or 3)     # returns 3  because it's the only operand evaluated to "true"
print(False or 3) # returns 3  because it's the only operand evaluated to "true"
print(None or 3)  # returns 3  because it's the only operand evaluated to "true"
print("" or 3)    # returns 3  because it's the only operand evaluated to "true"
{% endJDoodle %}

## Comparison of floating point expressions

* Exact comparisons of floating point values sometimes turn out wrong due to precision loss during assignment or arithmetic operations

* Comparisons of floating point expressions should be done within a certain margin

{% JDoodle %}
# example of a numerical discrepancy
a = 2.8
b = 2.4
diff = 0.4
if a - b != diff:
  print("A numerical discrepancy was detected: {} - {} = {}".format(a, b, a - b))

# example of comparison within a margin
if abs(((a - b) - diff) / diff) <= 0.001:
  print("{} - {} == {} : Comparison performed within 0.1% error".format(a, b, diff))
{% endJDoodle %}