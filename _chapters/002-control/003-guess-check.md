---
title: Guess and check
slug: guess check
abstract: An algorithmic approach to simplify complex compound conditional expression
---

## Problem: maximum of ten integer values

Below is a program template containing ten different integer variables. Using conditional statements with compound Boolean expressions, find and print the maximum out of the ten values.
{% JDoodle %}
v1 = 35
v2 = -4
v3 = 108
v4 = 21
v5 = 93
v6 = -43
v7 = 13
v8 = 62
v9 = -26
v10 = 78
{% endJDoodle %}

{% Solution %}
{% JDoodle %}
v1 = 35
v2 = -4
v3 = 13
v4 = 21
v5 = 93
v6 = -43
v7 = 108
v8 = 62
v9 = -26
v10 = 78

if v1 >= v2 and v1 >= v3 and v1 >= v4 and v1 >= v5 and v1 >= v6 and v1 >= v7 and v1 >= v8 and v1 >= v9 and v1 >= v10:
    print(v1)
if v2 >= v1 and v2 >= v3 and v2 >= v4 and v2 >= v5 and v2 >= v6 and v2 >= v7 and v2 >= v8 and v2 >= v9 and v2 >= v10:
    print(v2)
if v3 >= v1 and v3 >= v2 and v3 >= v4 and v3 >= v5 and v3 >= v6 and v3 >= v7 and v3 >= v8 and v3 >= v9 and v3 >= v10:
    print(v3)
if v4 >= v1 and v4 >= v2 and v4 >= v3 and v4 >= v5 and v4 >= v6 and v4 >= v7 and v4 >= v8 and v4 >= v9 and v4 >= v10:
    print(v4)
if v5 >= v1 and v5 >= v2 and v5 >= v3 and v5 >= v4 and v5 >= v6 and v5 >= v7 and v5 >= v8 and v5 >= v9 and v5 >= v10:
    print(v5)
if v6 >= v1 and v6 >= v2 and v6 >= v3 and v6 >= v4 and v6 >= v5 and v6 >= v7 and v6 >= v8 and v6 >= v9 and v6 >= v10:
    print(v6)
if v7 >= v1 and v7 >= v2 and v7 >= v3 and v7 >= v4 and v7 >= v5 and v7 >= v6 and v7 >= v8 and v7 >= v9 and v7 >= v10:
    print(v7)
if v8 >= v1 and v8 >= v2 and v8 >= v3 and v8 >= v4 and v8 >= v5 and v8 >= v6 and v8 >= v7 and v8 >= v9 and v8 >= v10:
    print(v8)
if v9 >= v1 and v9 >= v2 and v9 >= v3 and v9 >= v4 and v9 >= v5 and v9 >= v6 and v9 >= v7 and v9 >= v9 and v9 >= v10:
    print(v9)
if v10 >= v1 and v10 >= v2 and v10 >= v3 and v10 >= v4 and v10 >= v5 and v10 >= v6 and v10 >= v7 and v10 >= v8 and v10 >= v9:
    print(v10)
{% endJDoodle %}
{% endSolution %}

* Due to the large number of conditions needed, any solution relying on compounding them with the logical and operator will be complex and long and thus error-prone.
* Simplifying such program can be done:
  * algorithmically: via the Guess and Check approach
  * syntactically: via the use of collections and loops (next lesson)

## “Maximum of ten integer values” with Guess and Check

The Guess and Check approach consists in the following steps:

* Initialize a variable that **would** store the final result with a candidate value i.e. a value that may potentially be the final result, if it verifies the necessary conditions
* Using multiple conditional statements (with simple conditions), update the result variable with a new one, at each statement the condition is not valid on the current value
* The variable will contain the correct result at the end of all the necessary conditional statements.

{% JDoodle %}
v1 = 35
v2 = -4
v3 = 13
v4 = 21
v5 = 93
v6 = -43
v7 = 108
v8 = 62
v9 = -26
v10 = 78

maximum = v1
if v2 >= maximum:
    maximum = v2
if v3 >= maximum:
    maximum = v3
if v4 >= maximum:
    maximum = v4
if v5 >= maximum:
    maximum = v5
if v6 >= maximum:
    maximum = v6
if v7 >= maximum:
    maximum = v7
if v8 >= maximum:
    maximum = v8
if v9 >= maximum:
    maximum = v9
if v10 >= maximum:
    maximum = v10
print(maximum)
{% endJDoodle %}

* Though the code still contains many conditional statements, the conditions are simple so the code is more readable, easier to understand and errors are less likely.

## Problem: Maximum of an arbitrary set of integers

* One can make the above code generic by acquiring the values (problem instance) from the user. However, the count of these numbers will always be fixed at 10.
* When the problem input is a set of values, genericity can be introduced at another level/dimension which is the **size** of the set.

* This requires:
    * objects/variables able to store an arbitrary count of values : collections or data structures
    * constructs for repeating operations an arbitrary number of times
* Guess and Check and more generally Accumulators is a very common approach to solve problems where an arbitrary number of operations (loop) is required.