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

* Based on input validity test , the program decides or choses to solve the program or handle the wrong input

## Making choices or decisions

* Making choices is essential for more than just validating input

* Many algorithms require making decisions or executing steps based on the verification of some condition

* Most of the times, conditions are Boolean expressions involving variables which value is only known at execution time

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

