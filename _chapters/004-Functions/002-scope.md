---
title: Variables scopes, Arguments mutability
slug: scope
abstract:
---

## Base example: function reversing a string

Write a function which returns the reverse of a string, passed as argument.


#### Explanation:

* _**What**_: Reverse a string
* _**How**_ (algorithm): use for loop and concatenation or use slicing operator with negative step
* _**Interface**_:
  * _Good function names_: `reverseString`, `reverse_string`, `strReverse`, `str_reverse`, etc.
  * _Argument / parameter_: a string
  * _Return value_: a string with the same characters as the argument but in reverse order

Write a short script to call the function, so to test it.

{% empty_jdoodle %}


{% Solution %}
{% JDoodle %}
def strReverse(s):
    rev = ""
    for c in s:
        rev = c + rev
    # other implementation
    # rev = s[::-1]
    # or simply
    # return s[::-1]
    return rev


print(strReverse("This is CS201")) # the argument here is the literal string "This is CS201"
s1 = "This is CS201"
s2 = strReverse(s1)
{% endJDoodle %}
{% endSolution %}

## Variables scope

* **Scope** refers to the area in a program where a variable/object is defined, with respect to a certain function
  * Note that a variable/object is defined when it is assigned a value
* We can talk about 4 scopes in Python (according to Mark Lutz):
  * Local scope
  * Enclosing scope
  * Global scope
  * Built-in scope

## Local scope

* Starts at function definition and extends to the whole body of a function
* Includes formal parameters of a function and all variables defined in the function's body
  * In the example below, `s`, `rev` and `c` are all local variables to the function `strReverse`
* Local object/variables are not accessible (usable) outside the function
  * The example below results in an undefined identifier error, because the variable `rev` is only accessible from the function `strReverse`


{% JDoodle %}
s = "This is CS201"

def strReverse(s): 
    rev = ""
    for c in s:
        rev = c + rev
    s = "empty"  # we can modify the value of the formal parameter
    print(f"Overwritten the formal parameter {s =}")
    return s


result = strReverse("Hello world")
print(result) # this is a copy of the variable rev (local to the function), made by the return construct
#print(rev)  # this creates an error as rev has the local scope of the function


print(strReverse(s))  # Even though the argument has the same name as the formal parameter, they are two different objects because they are defined in different scopes
print(s)   # the value of the argument s remains the same after calling the function, eventhough the function modifies its formal parameter (local variable) value to "empty" 


{% endJDoodle %}


## Enclosing and global scope

* _**Enclosing scope**_: Functions can access variables defined in the (main) script, either to use their values or to modify them, via methods.
  * Functions cannot directly "assign" new values to enclosing scope variable, since assignment is interpreted a defining a new local variable
* _**Global scope**_: to allow a function to modify a variable defined in the enclosing scope via assignment, it must be explicitly specified as `global`

> * Using _**enclosing**_ and _**global**_ scope variables is possible but is **not a recommended** programming procatice and will **not be accepted** in this course assessments.
> * The right programming practice is to make functions as self-contained units of code and independent from the context where they are defined.
> * If a function is supposed to modify the value of some variable/object defined outside, the object should be provided as function argument and eventually returned.
{: .block-danger }

{% JDoodle %}
def foo():
    count = 34
    print(f"in the function {count =}")
    len = 67
    print(f"in the function {len =}")
    #print(len("Hello"))
    


count = 25
print(f"before the call to foo {count =}")
foo()
print(f"after the call to foo {count =}")
print(len("Hello"))
{% endJDoodle %}

#### Enclosing example
{% JDoodle %}
def strReverse(s):
    rev = ""
    for c in s:
        rev = c + rev
    print(f"This is string #{count}")
    #reversedInputs.append(rev)  # refers to the list defined in the main code at line 13
    #reversedInputs = reversedInputs + [rev]   # errors out
    count = 34
    print(count)                       # errors out
    return rev


reversedInputs = []
count = 1
inputString = input("Enter a string to get its reverse, enter 'quit' to exit the program: ")
while inputString != "quit":
    print(strReverse(inputString))
    count = count + 1
    inputString = input("Enter a string to get its reverse, enter 'quit' to exit the program: ")

print(f"These are all reversed strings: {reversedInputs}")
print(f"We reversed {count} strings.")

{% endJDoodle %}

#### Global example
{% JDoodle %}
def strReverse(s):
    rev = ""
    for c in s:
        rev = c + rev
    global reversedInputs  # without it, the next line will try to create a local list
    reversedInputs = reversedInputs + [rev]
    global count
    count = count + 1
    return rev


reversedInputs = []
count = 0
inputString = input("Enter a string to get its reverse, enter quit to exit the program: ")
while inputString != "quit":
    print(strReverse(inputString))
    inputString = input("Enter a string to get its reverse, enter quit to exit the program: ")

print(f"These are all reversed strings: {reversedInputs}")
print(f"We reversed {count} strings.")

{% endJDoodle %}

#### Proper Practice
{% JDoodle %}
def strReverse(s, countOfReversed, reversedStrings):
    rev = ""
    for c in s:
        rev = c + rev
    reversedStrings += [rev]
    countOfReversed += 1
    return rev, countOfReversed, reversedStrings


reversedInputs = []
count = 0
inputString = input("Enter a string to get its reverse, enter quit to exit the program: ")
while inputString != "quit":
    reversedString, count, reversedInputs = strReverse(inputString, count, reversedInputs)
    print(reversedString)
    inputString = input("Enter a string to get its reverse, enter quit to exit the program: ")

print(f"These are all reversed strings: {reversedInputs}")
print(f"We reversed {count} strings.")

{% endJDoodle %}

## Built-in scope

* Includes all objects and function defined by default in Python standard library e.g. `len()`, `range()`, `max()`, etc.
* Assigning new values to identifiers of function and objects already used in the standard library overwrites their existing definition, and prevents from using that built-in functionality.
* Local scope has precedence over enclosing scope which has precedence over global scope which has precedence over built-in scope

{% JDoodle %}
def length(L):
    len = 0  # shadowing (redefining) the built-in function len into an int
    for i in range(len(L)): # errors out here: TypeError
        len = len + 1
    return len

myList = [1, 2 ,3]
print(length(myList))

{% endJDoodle %}

## Mutable vs immutable arguments

* When passing an **immutable** object as argument to a function, its **value** is copied into the formal parameter => modifying the value of the formal parameter within the function does not affect the object passed as argument
* When passing a **mutable** object as argument to a function, a **reference** to the object is passed to the formal parameter => the function is able to alter the object passed as argument by altering its formal parameter
* The common practice in programming is that functions DO NOT (intentionally) mutate their arguments
* To prevent from **accidentally** altering a mutable argument, start the function with a copy of the argument, and work only with the copy
* Additionally, any alteration attempted with an assignment results in creating a local variable with the same name as the formal parameter, thus won't be reflected on the argument.

#### Immutable
{% JDoodle %}
# This code is to illustrate how immutable objects passed as arguments are not affected by function modifications
def foo(x):
    print("In the function, the original value of the parameter x is", x)
    x += x
    # x = x + x
    print("In the function, the parameter x was modified to", x)
    return x


z = "hello"  # try experimenting with immutable objects like integer, floating point, strings and tuples
print(f"The argument passed to foo from the main code is the object {z =}")
y = foo(z)
print(f"After executing the function, in the main code, the argument that was passed to foo, {z =}")
print(f"The function return value is stored in {y =}")

{% endJDoodle %}

#### Mutable
{% JDoodle %}
# This code is to illustrate how mutable objects passed as arguments are not affected by function modifications'''
def foo(L):
    print("In the function foo, the original value of the parameter L is", L)
    L.extend([4, 5, 6])
    #L += [4, 5, 6]  # would also provide the same result
    L[0] *= 10
    print("In the function foo, the parameter L was modified to", L)
    return L


def bar(L):
    print("In the function bar, the original value of the parameter L is", L)
    L = L + [4, 5, 6]  # the assignment will however dynamically refer L to a local object different from the argument
    L[0] *= 10
    print("In the function bar, the parameter L was locally redefined and modified to", L)
    return L

L1 = [1, 2, 3]
print(f"The argument passed to foo from the main code is the object {L1 =}")
L2 = foo(L1)
print(f"After executing the function, in the main code, the argument that was passed to foo, {L1 =}")
print(f"The function returns {L2 =}, a copy of the parameter L (which is a reference to the argument L1)")
L1 = []
print(f"Indeed, after setting L1 = [], still {L2 =}")
print("============================================================================================")
L3 = [1, 2, 3]
print(f"The argument passed to bar from the main code is the object {L3 =}")
L4 = bar(L3)
print(f"After executing the function, in the main code, the argument that was passed to bar remains, {L3 =}")
print(f"The function returns {L4 =}, a copy of the local list L created in the function")
{% endJDoodle %}


#### Mutable VS Immutable
{% JDoodle %}
def strReverse(s, reverseList):
    s = s[::-1]  # modification is only local
    reverseList.append(s)   # argument will be mutated
    return s


reversedInputs = []
inputString = input("Enter a string to get its reverse, enter quit to exit the program: ")
while inputString != "quit":
    rev = strReverse(inputString, reversedInputs)
    print(rev, "is the reverse of ", inputString)
    inputString = input("Enter a string to get its reverse, enter quit to exit the program: ")
print("These are all reversed strings:", reversedInputs)


{% endJDoodle %}


## Practice

### Returning without mutating the argument

* Write a function that takes as argument a list of positive integers and returns a list of pairs (n, count) where
  * n is one element of the argument list
  * count is the number of steps needed to reduce n to 0 following the rules
    * If the number is even, divide it by 2
    * If the number is odd, decrement it by 1
* Your function should not modify its argument i.e. if you pass a list object as argument it should remain unchanged after the function call
* For instance, if you pass the object `L1 = [3, 45, 59, 16, 32, 89]` as argument, the function should return `[(3, 3), (45, 9), (59, 10), (16, 5), (32, 6), (89, 10)]` while `L1` remains the same

{% empty_jdoodle %}

{% Solution %}
{% JDoodle %}
def reduceToZero(intList):
    result = []
    for value in intList:
        count = 0
        tmp = value
        while value > 0:
            if value % 2 == 0:
                value //= 2
            else:
                value -= 1
            count += 1
        result.append((tmp, count))
    return result


L1 = [3, 45, 59, 16, 32, 89]
L2 = reduceToZero(L1)
print(L1)
print(L2)
{% endJDoodle %}
{% endSolution %}


### Mutating the argument (although not a common practice)

* Write a function that takes as argument a list of positive integers and transforms it into a list of pairs (n, count) where
  * n is one element of the argument list
  * count is the number of steps needed to reduce n to 0 following the rules
    * If the number is even, divide it by 2
    * If the number is odd, decrement it by 1
* This function should not return any object
* For instance, if you pass the object `L = [3, 45, 59, 16, 32, 89]` as argument, after the function call `L` becomes `[(3, 3), (45, 9), (59, 10), (16, 5), (32, 6), (89, 10)]`

{% empty_jdoodle %}

{% Solution %}
{% JDoodle %}
def reduceToZero(intList):
    for i in range(len(intList)):
        count = 0
        value = intList[i]
        while value > 0:
            if value % 2 == 0:
                value //= 2
            else:
                value -= 1
            count += 1
        intList[i] = (intList[i], count)
    print(intList)

def otherReduceToZero(intList):
    localCopy = intList.copy()
    intList.clear()   # intList = []  does not work, will create a local object
    for value in localCopy:
        count = 0
        tmp = value
        while value > 0:
            if value % 2 == 0:
                value //= 2
            else:
                value -= 1
            count += 1
        intList.append((tmp, count))



L1 = [3, 45, 59, 16, 32, 89]
reduceToZero(L1)
print(L1)

L2 = [3, 45, 59, 16, 32, 89]
otherReduceToZero(L2)
print(L2)

{% endJDoodle %}
{% endSolution %}