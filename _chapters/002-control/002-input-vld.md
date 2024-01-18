---
title: Input validation
slug: inp vld 
abstract: Validating program input with conditional statements and exceptions
---

## Input validation
* In many computational problems, the input has very specific type and range of values

    * Example: a 6-letters string, a 3-digits positive integer, etc.

* Inappropriate user input can lead to runtime errors

* Some input properties can be checked using simple if statements

    * Example: checking that an input string has exactly 6 characters

* Some runtime errors cannot be avoided by simple `if` statements

    * Conversion of a string containing non-digit characters to an `int`

* A `try-except` statement allows to detect and handle such runtime errors AKA **exceptions**

## Try-except

Syntax:
```
<statements before try-except>
try:
<try-block statements>
except [Exception]:
<except-block statements>
<statements after the try-except code>
```

* If a runtime error happens in the `<try-block statements>`, the `<except-block statements>` are executed, otherwise they are skipped

* `[Exception]` specifies which type of error to lookout for. It is optional, if not specified, any exception will be detected

* Multiple `except` blocks can be defined for a `try` block, based on the type of exception and how to handle them

* `[Exception]` can be **thrown** by built-in operations and functions, from a set of built-in exceptions (not only relative to type conversion)

* Application code can also `throw` built-in or user-defined exceptions, in different scopes like functions or class methods. (discussed later)

* Runtime errors can happen for many reasons and not only at input: e.g. division by zero: a `try-except` statement should be used whenever there is a chance of runtime error that should be properly handled

* The way to handle errors is part of the application design and depends on the severity of the error e.g. if the error results in **undefined** user input that is crucial for computation, then handling the error should be either re-prompting or terminating the program.

{% JDoodle %}
try:
    numerator = int(input("Please enter the fraction numerator: "))
except ValueError: # detecting a ValueError exception that might have been raised by the try block, more specifically, the int() operator when it receives an unsuitable string argument
    print("You did not enter an integer value")
# at this point, numerator was not defined because int() conversion failed
# Subsequent computations with numerator will result in another runtime error
# so we need either re-prompt or just terminate the program
exit(1)

try:
    denominator = int(input("Please enter the fraction denominator: "))
except: # detecting any exception that might have been raised in the try block
    print("An error happened at data input")
exit(2)

try:
    if numerator % denominator == 0:
        print("The numerator is a multiple of the denominator.")
    else:
        print("The fraction is not a whole number.")
        print("{} / {}".format(numerator, denominator))
except ZeroDivisionError:
    print("The denominator cannot be 0")

# print("{} / {}".format(numerator, denominator)) # if uncommented, this would execute even if a division by zero happens since no exit statement appear in the except block
{% endJDoodle %}

## Exercise: Validating integer input

Write a program which

* prompts the user for an integer in the range \[0..255]
* validates that the user input is in the correct format and range
* prints its binary and hexadecimal representations using built-in operators (`bin()` and `hex()`)

{% empty_jdoodle %}

{% Solution %}
{% JDoodle %}
try:
    intEntry = int(input("Please enter an integer between 0 and 255: "))
    if  intEntry >= 0 and intEntry <= 255:
        print("the binary representation of", intEntry, "is", bin(intEntry))
        print("The hexadecimal representation of", intEntry, "is", hex(intEntry))
    else:
        print("This integer is out of range.")

except ValueError:
    print("This is not an integer.")

print("Done")

# other code structure
try:
    intEntry = int(input("Please enter an integer between 0 and 255: "))  
except ValueError:
    print("This is not an integer.")
exit(1)

if intEntry < 0 or intEntry > 255:
    print("This integer is out of range.")
else:
    print("the binary representation of", intEntry, "is", bin(intEntry))
    print("The hexadecimal representation of", intEntry, "is", hex(intEntry))

print("Done")
{% endJDoodle %}
{% endSolution %}

## Exercise: Validating floating point input

Write a program which

* prompts the user for a positive floating point number
* validates the input format and range
* prints its floor (corresponding also to the integral part) and its fractional part rounded to the 1000'th, separately

{% empty_jdoodle %}

{% Solution %}
{% JDoodle %}
try:
    userEntry = float(input("Enter a positive floating point number: "))
    if userEntry >= 0:
        print("The floor of {} is {}.".format(userEntry, int(userEntry // 1)))
        print("The decimal part of {} is {:.3f}.".format(userEntry, userEntry % 1))
    else:
        print("This is a negative number.")
except ValueError:
    print("This is not a floating point number.")
{% endJDoodle %}
{% endSolution %}

## Exercise: Validating string input

Write a program which:

* prompts the user for a single upper-case letter
* validates the input format and range
* prints the corresponding lower case letter

> This problem can be solved using
>   * string methods (not yet discussed)
>   * the string operators `ord()` and `chr()` and the ASCII table discussed in the previous lesson
{: .block-tip}

{% empty_jdoodle %}

{% Solution %}
{% JDoodle %}
userInput = input("Please enter a single upper-case letter: ")
if len(userInput) > 1:
    print("You entered more than one character")
elif ord(userInput) < 65 or ord(userInput) > 90: # userIput < 'A' or userInput > 'Z'
    print("This is not an upper-case letter")
else:
    print("The corresponding lower-case letter is", chr(ord(userInput)+32))
{% endJDoodle %}
{% endSolution %}
