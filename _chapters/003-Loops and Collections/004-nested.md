---
title: Nested loops, multidimentional lists
slug: nedted-loops
abstract:
---

## Floyd triangle

write a program which:

* defines a strictly positive integer number $n$
* prints the corresponding Floyd Triangle. The output consists in the consecutive numbers from 1 to  $\frac{n (n+1)}{2}$ spanning $n$ lines, where the i^th^ line consists of i consecutive integers. 

    * the numbers must be aligned in columns 
    * the spacing between columns should minimum but not less than 2 spaces

Below is the output of the program for $n = 6$

```
1
2   3
4   5   6
7   8   9   10
11  12  13  14  15
16  17  18  19  20  21
```

{% JDoodle %}
n = 6
{% endJDoodle %}

{% Solution %}
{% JDoodle %}
n = 6

# with 2 spaces separation but no guaranteed column alignment
term = 1
for i in range(1, n+1): # when n = 4, i = 1, 2, 3, 4
    line = ""
    for v in range(1, i+1): # when i = 3, v = 1, 2, 3
        line = line + str(term) + "  "
        term += 1
    print(line)

# with column alignment
termWidth = len(str(n * (n+1) // 2)) + 2  #extra spaces for separation
term = 1
for i in range(1, n+1):
    line = ""
    for v in range(1, i+1):
        nbrToStr = str(term)
        nbrToStr = nbrToStr.ljust(termWidth)
        line = line + nbrToStr
        #line += str(term).ljust(termwidth)
        term += 1
    print(line)

# alternatively
term = 0
triangle = ""
for i in range(1, n+1):
    for v in range(1, i+1):
        term += 1
        nbrToStr = str(term)
        triangle += nbrToStr.ljust(termWidth)
    triangle += "\n"
print(triangle)


# alternatively
term = 1
termsPerline = 0
lineNbr = 1
line = ""
while term <= n*(n+1)//2 :
    line += (str(term)).ljust(termWidth)
    term += 1
    termsPerline += 1
    if termsPerline == lineNbr:
        print(line)
        line = ""
        termsPerline = 0
        lineNbr += 1

{% endJDoodle %}
{% endSolution %}

## Floyd Triangle as nested lists

* Suppose we want to use Floyd triangle for further purposes, other than just printing.
* We need to store the numbers in memory, in a data structure, with the same (virtual) triangle-like layout
    * Each line is a separate sequence of numbers and we have an arbitrary number of sequences
    * We use one list to store the numbers of one line
    * We store these lists as elements of an (outer) list:  list-of-lists or nested lists

{% JDoodle %}
# modify this code to create the nested list where yu store the triangle elements
n = 6

term = 1
for i in range(1, n+1): # when n = 4, i = 1, 2, 3, 4
    line = ""
    for v in range(1, i+1): # when i = 3, v = 1, 2, 3
        line = line + str(term) + "  "
        term += 1
    print(line)
{% endJDoodle %}
(% Solution %}
{% JDoodle %}
n = 6

# generating the triangle as a list-of-lists
triangle = []   # start with an empty accumulator for the whole data structure
term = 1
for i in range(1, n+1):
    row = []
    for j in range(1, i+1):
        row.append(term)
        term += 1
    triangle.append(row)
# debug printout
print(triangle)

# alternatively
triangle = []
for i in range(1, n+1):
    # firstNumber = 1 + i * (i - 1) // 2
    # lastNumber = i * (i + 1) // 2
    # line = list(range(firstNumber, lastNumber+1))
    # triangle.append(line)
    triangle.append(list(range(1 + i * (i - 1) // 2, i * (i + 1) // 2 + 1)))
# debug printout
print(triangle)

# printing output
width = len(str(triangle[-1][-1])) + 2
for line in triangle:
    for value in line:
        print(str(value).ljust(width), end="")
    print()

# alternatively
output = ""
for line in triangle:
    for value in line:
        output += str(value).ljust(width)
    output += "\n"
print(output)

{% endJDoodle %}
{% endSolution %}

## Matrices: list-of-list or `numpy` array?

* Matrices can be stored as lists-of-lists:
    * Each row is a list of numbers
    * The matrix is a list of rows
    * To access matrix elements, we use double subscripts/indexing: e.g.: `L[1][5]`
    * The logic to check and maintain correct matrix dimensions have to be handled by the programmer
* Python lists are not efficient data structures to be used for compute-intense applications
* `numpy` is a library (package) fitted with the data type `Array` which is designed to better handle matrices for (more advanced) scientific applications
    * Automatically maintains correct matrix dimensions
    * Comes with a large set of handy matrix operations
    * Basic access and iteration patterns for numpy arrays/matrices are the same as those of lists-of-lists

## Lists and references

* Lists are not quite efficient because they are sequences of "references-to-objects"
* Unlike other built-in types, simple assignment does not make a copy, just an alias
* Multiple ways to make copies: slicing operator `[i:j:k]`, `list()` function, `copy()` method
* All perform _shallow copy_: if elements are themselves lists (list-of-list) the two objects remain _dependent_

{% JDoodle %}
L1 = [1, 2, 3]
L2 = [1, 2, 3]
print("L1 = ", L1, "L2 = ", L2)

L1[0] = 10
print("L1 = ", L1, "L2 = ", L2)
###############################

L1 = [4, 5, 6]
L2 = L1
print("L1 = ", L1, "L2 = ", L2)

L1[0] = 40
print("L1 = ", L1, "L2 = ", L2)
################################

L1 = [7, 8, 9]
L2 = list(L1)
L3 = L1[:]
L4 = L1.copy()
print("L1 = ", L1, "L2 = ", L2, "L3 = ", L3, "L4 = ", L4)

L1[0] = 70
print("L1 = ", L1, "L2 = ", L2, "L3 = ", L3, "L4 = ", L4)
################################

L1 = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
L2 = L1
print("L1 = ", L1, "L2 = ", L2)

L1.append([10, 12, 13])
print("L1 = ", L1, "L2 = ", L2)

L1[1] = [40, 50, 60]
print("L1 = ", L1, "L2 = ", L2)

L1[2][0] = 70
print("L1 = ", L1, "L2 = ", L2)
################################

L1 = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
L2 = list(L1)
L3 = L1[:]
L4 = L1.copy()
print("L1 = ", L1, "L2 = ", L2, "L3 = ", L3, "L4 = ", L4)

L1.append([10, 12, 13])
print("L1 = ", L1, "L2 = ", L2, "L3 = ", L3, "L4 = ", L4)

L1[1] = [40, 50, 60]
print("L1 = ", L1, "L2 = ", L2, "L3 = ", L3, "L4 = ", L4)

L1[2][0] = 70
print("L1 = ", L1, "L2 = ", L2, "L3 = ", L3, "L4 = ", L4)
################################
#
# # how to perform proper copy of list-of-list????????
{% endJDoodle %}
