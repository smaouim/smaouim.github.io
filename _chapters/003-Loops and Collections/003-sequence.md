---
title: "Sequences: string, tuples, lists and ranges"
slug: sequence
abstract: Operators and methods of built-in sequences; Example related problems 
---

## Introduction

* Repetition in computing does not involve only actions but also data
* It is not always possible to work with an arbitrary (runtime defined) amount of data while relying only on "scalar" variables.
* Python offers to aggregate an arbitrary number of pieces of data into one object (data structure, collection) under the same identifier (name)
* Strings, tuples and lists are **sequence** data structures
* The term **sequence** implies order; elements are **indexable** (accessible) by their **position** in the sequence.
* Indexes range from 0 to the number of elements -1
* Strings are sequences of characters while elements of tuples and lists can be of any type
* Strings and tuples are immutable while lists are mutable

## Initialization

{% JDoodle %}
sampleList = [23, 4.2, "hi", "abc"]
print(f"{sampleList =}")
sampleTuple = (23, 4.2, "hi", "abc")
print(f"{sampleTuple =}")
x = 15
y = "CS290"
z = 2.6
myList = [y, "y", 2, x, 6.3, z]
print(myList, "is a", type(myList))
x = 5
y = "CS207"
z = 0.9
print(f"{myList =}")

myTuple = (3, 5, x)
print(myTuple, "is a", type(myTuple))
x = 10
print(f"{myTuple =}")

myList = [[x, 12], 0, (y, 12, z)]
print(f"{myList=}")

myTuple = ([x, 12], 0, (y, 12, z))
print(f"{myTuple =}")
{% endJDoodle %}

## Basic operations

* Number of elements with operator `len()`
* Element access with operator `[ ]`, negative index possible for inverted order
* Concatenation with operator `+`
* Comparison `==, != , > , >=, <, <=`
* Iterating with `for`
    * `e in x`: return `True`, if object / substring `e` is present in list / string `x`, and `False` otherwise.
    * `x[i : j : k]`: returns the slice of sequence `x` composed of the objects from index `i` to `j-1`, skipping by `k` steps. If `i` is omitted, 0 is used. If `j` is omitted, the length of the sequence is used. If `k` is omitted, 1 is the default. Negative values can be used
    *` x * i` : generate a new list / string where the list / string `x` is repeated `i` (integer) times

{% JDoodle %}
list1 = [5, 6 , 9, 4, 10, 3]
print(f"list1 has {len(list1)} elements")
print(f"{list1 =}")
print(f"{list1[1] =}")
# print(f"{list1[6] =}") # out of range error 
print(f"{list1[-3] =}") # eq to list1[len(list1) - 3]
# print(f"{list1[-7] =}")  # out of range error 

list2 = ['a', 'f', 'c']
print(f"{list2 =}")
list2[0] = 1  # element modification of a list using subscript operator
print(f"{list2 =}")

list3 = list2 + list1 # concatenation with +
print(f"{list3 =} = list1 + list2 and has {len(list3)} elements")
x = 3.5
print(f"{x =}")
list3 += [x] # rhs has to be a list. Its content will be appended
print(f"{list3 =} = list3 + [x]")

tuple1 = (1, 2, 3)
print(f"{tuple1 =}")
print(f"{tuple1[0] =}")
#tuple1[1] = 4  # element modification of a tuple not permitted

tuple2 = tuple(list1) # conversion from list ot tuple, opposite is also possible
print(f"{tuple2 =}")

tuple3 = tuple1 + tuple2 # concatenation
print(f"{tuple3 =} = tuple1 + tuple2")


if tuple1 >= tuple2: 
    print("tuple 1 is greater that tuple 2")
else:
    print("tuple 2 is greater than tuple 1")

tuple4 = tuple(list3)
# if tuple1 >= tuple4: # errors out: elements of tuples don't have the same type
#     print("tuple 1 is greater that tuple 3")
# else:
#     print("tuple 3 is greater than tuple 1")

if 'c' in list3:
    print("Found 'c' in ", list3)

if 6 in tuple1:
    print("found 6 in ", tuple1)

str1 = "Hello world!"
if 'o w' in str1:
    print("'o w' is a substring of ", str1)

str2 = str1[2:10:2] # slicing
print(f"{str2 =} = str1[2:10:2]")

list4 = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k"]
print(f"{list4 =}")
print(f"{list4[::-1] =}") # reversing

str3 = str2 * 3
print(f"{str3 =} = str2 * 3")

list2 *= 2 # list2 = list2 * 2
print(f"{list2 =}  after list2 *= 2")
{% endJDoodle %}

## Exercise: Standard deviation of a sequence of numbers

Complete the below scaffold, to compute and display the standard deviation $\sigma$ of a user-prompted sequence of floating point numbers, _ignoring any non-numerical entry_.

The user needs to enter the string "q" or "Q" to signal the end of the sequence of numbers.

$$\sigma=\sqrt{\frac{\sum{(x_i - \mu)^2}}{N-1}}$$

where: $x_i$ are the numbers of the sequence, $\mu$ is their mean (average) and $N$ their count (size of the sequence).

> * The mean computation can be done using accumulation but not the standard deviation
> * All $x_i$ have to be stored in a list to compute all $(x_i - \mu)$
> * The list is compiled by appending to an initially empty list [ ], one user entry at each iteration
{: .block-tip }

{% empty_jdoodle %}

{% Solution %}
{% JDoodle %}
print("This program computes the average and standard deviation of a set of numbers")
print("Please enter the one number at each prompt. Enter q or Q to stop prompting and get the result")

inputValues = []
while True:
    userEntry = input("? ")
    if userEntry == 'q' or userEntry == 'Q':
        break
    try:
        numEntry = float(userEntry)
    except:
        print("You entered a non numerical value. This entry will be ignored")
        continue
    # at this point we have a valid floating point value
    # any of the following statements would append the current number to the list of numbers
    inputValues += [numEntry]

# The following condition is not input validation, as entering q in the first iteration
# can be considered as a valid input.
# this is a special/edge case that has to be handled separately
# not to cause a ZeroDivisionError exception/error
if len(inputValues) == 0:
    print("list is empty")
else:
    average = 0
    for val in inputValues:
        average += val
    average /= len(inputValues) # average = average / len(inputValues)
    stdDev = 0
    for val in inputValues:
        stdDev += (val - average)**2
    stdDev = (stdDev / len(inputValues))**0.5
    print("The average of this set of values is:", average)
    print("The standard deviation of this set of values is:", stdDev)

{% endJDoodle %}
{% endSolution %}

## Iterating with `for` and `range()`

* In order to modify individual elements of a list, one needs to access them by their index
* Iterating using a basic `for` loop does not allow to access list elements using their indexes
* Using a `while` loop remains the most general approach but requires explicitly handling an index variable
* `range  ([i,] j [, k])`  allows you to generate a **sequence of integers** (not a list) starting with `i`, ending at `j` and with a step `k`. These can be **used as indexes** for iterating through sequences with a `for` loop


{% empty_jdoodle %}

{% Solution %}
{% JDoodle %}
list2 = ['a', 1.2, 'f', 13, 'c', 43, "hello"]
print("elements of list2")
for val in list2:
    print(val)
    val = "123"
print("list2 =", list2)

print("range(0, 10) = ", range(0, 10))
print("list(range(0, 10)) = ", list(range(0, 10)))
print("list(range(2, 20, 5)) = ", list(range(2, 20, 5)))

print("elements of list2")
for i in range(len(list2)): # same as range(0, len(list2), 1)
    print(list2[i])
    list2[i] *= 2
print("list2 =", list2)

print("every other element of list2")
for val in list2[1:len(list2):2]:
    print(val)

print("every other element of list2")
for i in range(1,len(list2),2):
    print(list2[i])

# generating lists with list comprehensions
pattern = [i for i in range(10)] # list(range(10))
print(f"{pattern = }")
# same as
pattern = []
for i in range(10):
    pattern += [i]
print(f"{pattern = }")

# double of every other element of list2
list3 = [value * 2 for value in list2[1::2]]
print(f"{list3 =}")
list3 = []
for value in list2[1::2]:
    list3 += [value * 2]
print(f"{list3 =}")
{% endJDoodle %}
{% endSolution %}


## Built-in functions for sequences

* The Python Standard Library offers a set of utility (free) functions.
* Few of these function are useful operations on sequences (and most generally iterables), namely `min()`, `max()`, `sum()`, `sorted()`, `reversed()`, `zip()` etc.

For the full documentation of these functions refer to [https://docs.python.org/3/library/functions.html](https://docs.python.org/3/library/functions.html)

### Exercise: sum of multiples of 3

Write ONE line of code that prints the sum of the multiples of 3 smaller than 100.

The expected output is:

```
1683
```

{% empty_jdoodle %}

{% Solution %}
{% JDoodle %}
print(sum([i for i in range(3, 100, 3)]))
print(sum(list(range(3, 100, 3))))
{% endJDoodle %}
{% endSolution %}


## Methods

* Python is an Object Oriented Programming (OOP) language
* Objects can be as simple as a single integer or float or more elaborate like strings (sequence of characters) or lists and tuples (sequence of arbitrary objects)
* Objects with the same **properties** have the same `type` or belong to the same `class` (OOP terminology)
* Properties include **operations** that can be performed with (or on) these objects
* Syntactically, few operations are expressed with **operators**, few others with (free) **functions** and others with **methods**
* Methods are called upon some object using the selection operator `ObjectName.methodName(arguments)` 
* No one is supposed to recall all methods of the built-in sequences (or any class)
* Everyone is supposed to know how to **find out** _whether some method exists_ and _how to use it_, by looking up the proper **documentation**
* Some of the previous problems in this course can be solved more elegantly, if some of these methods are used
* In subsequent problems and examples, use of these methods is **recommended** and **expected**

## Strings, Lists and Tuples reference

* The exhaustive reference to sequence operations and methods is the Python Standard Library documentation

[https://docs.python.org/3/library/stdtypes.html#sequence-types-list-tuple-range](https://docs.python.org/3/library/stdtypes.html#sequence-types-list-tuple-range)

[https://docs.python.org/3/library/stdtypes.html#text-sequence-type-str](https://docs.python.org/3/library/stdtypes.html#text-sequence-type-str)

* The documentation is sometimes confusing for beginners (contains terminology known only to advanced programmers)
* A beginner-friendly reference:

[https://link.springer.com/content/pdf/bbm:978-1-84996-537-8/1?pdf=chapter toc](https://link.springer.com/content/pdf/bbm:978-1-84996-537-8/1?pdf=chapter toc)

### Exercise: Sequence input

In the standard deviation exercise, the elements of the sequence are prompted for one-at-a-time, making the interface tedious. For a better interface, we would like the user to enter all elements of the sequence in one prompt, space-separated.

Write a program which:

* prompts the user for a space-separated sequence of numbers
* generates and prints a list of all the numerical entries (ignoring non-numerical ones). Note that the elements of the list are expected to be floats.

Sample run:

```
Please enter the numbers separated by spaces: 1 2.4  6.3        12 q.6 7.5 9.1
[1.0, 2.4, 6.3, 12.0, 7.5, 9.1]
```

> Look for the semantics of string method `split()` and use it to process the user (raw string) input.
{: .block-tip }

{% empty_jdoodle %}

{% Solution %}
{% JDoodle %}
inputString = input("Please enter the numbers separated by spaces: ")
listOfStrings = inputString.split()  # this uses any white spaces as separators: multiple single spaces, tabs, new line, etc
# print(listOfStrings)  # this is not enough. The list contains strings now, and they may not be convertible to numbers

# listOfStrings = inputString.split(" ")   # this uses exactly one space as a separator. the above is more general
# print(listOfStrings)

# one can prompt and specify another separator, commas for instance
# inputString = input("Please enter the numbers separated by commas")
# listOfStrings = inputString.split(",")
# print(listOfStrings)

listOfFloats = []
for s in listOfStrings:
    try:
        s = float(s)
        listOfFloats.append(s)  # listOfFloats += [s]
    except ValueError:
        pass  # also continue should work

print(listOfFloats){% endJDoodle %}
{% endSolution %}
