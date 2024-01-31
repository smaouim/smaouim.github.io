---
title: Iterating with "while"
slug: while
abstract: Fundamental looping construct; Graceful input validation
---

## The `while` statement

Syntax:

```
<statements before while>
while <conditional-expression>:
    <loop body>
<statements after while>
```

* Executes the indented statements, as long as the given condition evaluates to True
* To execute at least one iteration, the conditional expression must be True at the first evaluation
* If the execution of the loop body does not eventually change the value of the conditional expression, the body will be executed infinitely.

### Simple example

{% JDoodle %}
counter = 1
bound = 5 # int(input("Please provide a bound: "))
while counter <= bound:
    print(counter)
    counter += 1 # counter = counter + 1
print("done")
{% endJDoodle %}

### Exercise: Sum of digits

Write a program which:

* initializes a variable `n` with an integer value (positive or negative)
* computes and prints the sum of its digits.

#### Idea

* For a positive integer, the right most digit is the remainder of division by 10.
    * if the number has only a single digit, the remainder is the one digit
* To eliminate the right most digit from the number, floor-divide it by 10.
    * If the number has only a single digit, the floor division results in 0 and any subsequent division will also result in 0.
* **Repeatedly** **_extract, accumulate and eliminate the rightmost digit_**, **until** no digits remain (i.e. the number becomes 0)

{% empty_jdoodle %}

{% Solution %}
{% JDoodle %}
n = 98765434567  # try n = -98765434567 as well
initial_n = n
n = abs(n)
sumOfDigits = 0
while n != 0:
    # rightDigit = n % 10
    # sumOfDigits = sumOfDigits + rightDigit
    sumOfDigits += n % 10 # sumOfDigits = sumOfDigits + n % 10
    n = n // 10

print(f"The sum of digits of {initial_n} is {sumOfDigits}.")
{% endJDoodle %}

Another solution
{% JDoodle %}
working = str(abs(initial_n))
sumOfDigits = 0
index = 0
nbrCharacters = len(working)
while index < nbrCharacters:
    sumOfDigits += int(working[index])
    index += 1

print(f"The sum of digits of {initial_n} is {sumOfDigits}.") 
{% endJDoodle %}
{% endSolution %}

### Exercise: Generate the binary representation of a positive integer

Write a program which:

* initializes a variable n with a positive integer value
* computes and prints its binary representation

#### Idea

* For a positive integer, the right-most bit is the remainder of division by 2.
  * e.g. (83)<sub>10</sub> = (1010011)<sub>2</sub> . Note that 83 % 2 = 1 and the right-most bit of its binary representation is 1.
* The other bits represent the number obtained by floor division by 2.
  * e.g. (83)<sub>10</sub> = (1010011)<sub>2</sub> , 83 // 2 = 41 and (41)<sub>10</sub> = (101001)<sub>2</sub> 
* **Repeatedly** _extract, accumulate and eliminate the rightmost bit_, **until** no bits remain (i.e. the number becomes 0)
* The result should be stored as a “string of bits” i.e. a string of the characters “0” and “1”. Thus, accumulation actually consists of concatenating one bit at each iteration, considering that the first iteration produces the right-most bit, the second iteration produces the second most-right, etc.

{% empty_jdoodle %}

{% Solution %}
{% JDoodle %}
n = 83
if n >= 0:
    binary_n = ""
    working_n = n 
    while working_n > 0:
        binary_n = str(working_n % 2) + binary_n
        working_n = working_n // 2
    print(f"bin({n}) = {binary_n}")
else:
    print("Negative number")
{% endJDoodle %}
{% endSolution %}

### Exercise: Maximum of an arbitrary set

Write a program which:

* repeatedly prompts the user for integer numbers (positive and negative) until the user enters the value 0.
* prints the maximum value entered by the user


> For simplicity, assume input validity (i.e. don’t validate the inputs).
> 
> Besides, if you use a Guess and Check approach, you don’t need to aggregate (collect) all the user entries in one object/variable.
{: .block-tip }

{% empty_jdoodle %}

{% Solution %}
{% JDoodle %}
print("This program finds the maximum of a sequence of integers")

print("Please enter integers at the prompt. Enter 0 to terminate the sequence")
userEntry = int(input("? "))
# There should be some input validation, but was removed to avoid distraction.
# we use Guess and Check approach, with an arbitrary number of entries to compare
# Our initial guess is: first entry is the max
if userEntry != 0:
    maximum = userEntry
    while userEntry != 0:
        if userEntry > maximum:
            maximum = userEntry
        userEntry = int(input("? "))
        
    print("The maximum value is", maximum)
else:
    print("No maximum found. The sequence is empty")
{% endJDoodle %}
{% endSolution %}


### Exercise: Second maximum

In the IDE below, make a copy of your solution to the problem above then modify it such that the program prints also the second maximum.

There are a few considerations here:

* If the user entries contain repeated values of the maximum, then the second maximum will be equal to the maximum. You can choose to stay with that outcome or opt for finding different maximum and second maximum values.
* To get a second maximum, the user needs to enter at least two values. Again, requiring them to be different is a choice.

{% empty_jdoodle %}

{% Solution %}
{% JDoodle %}
print("This program finds the maximum and the second maximum of a sequence of integers")
# the maximum and the second maximum will be the same value if the largest value entered by the user is repeated
print("Please enter integers at the prompt. Enter 0 to terminate the sequence")
userEntry = int(input("? "))
if userEntry == 0:
    print("No maximum found. The list is empty")
else:
    maximum = userEntry
    # We get a second entry to initialize the second max
    userEntry = int(input("? "))
    # If the second entry is a 0, there is no second max: this is validation of the problem size
    if userEntry == 0:
        print("Only one value was entered. At least two values are needed.")
    else:
        # A proper guess for the second maximum needs to take into account
        # how it compares to the guess of the maximum and amend that guess if needed
        # That would eventually be achieved in the first loop iteration,
        # if we simply take the second entry as the guess of the second maximum
        if userEntry > maximum:
            # the new entry becomes the max while the first becomes the second
            sndMax = maximum
            maximum = userEntry
        else:
            # the new entry is less or equal to the current guess for max
            # so it becomes the initial guess for the second max
            sndMax = userEntry
        while userEntry != 0:
            if userEntry > maximum:
                sndMax = maximum
                maximum = userEntry
            elif userEntry > sndMax:
                sndMax = userEntry
            else:
                pass
            userEntry = int(input("? "))

        print("The maximum value is", maximum)
        print("The second maximum value is", sndMax)
{% endJDoodle %}

Another solution
{% JDoodle %}
print("This program finds the maximum and the second maximum of a sequence of integers")
# the maximum and the second maximum are required to be different. if the user enters less than 2 values or all equal values, then there is no second max
print("Please enter integers at the prompt. Enter 0 to terminate the sequence")
userEntry = int(input("? "))
if userEntry == 0:
    print("No maximum found. The list is empty")
else:
    maximum = userEntry
    sndMax = userEntry
    # We need a different second entry to initialize the second max
    userEntry = int(input("? "))
    while userEntry != 0 and maximum == sndMax:
        if userEntry > maximum:
            sndMax = maximum
            maximum = userEntry
        elif userEntry < maximum:
            sndMax = userEntry
        userEntry = int(input("? "))
    if maximum == sndMax:
        print("No second maximum found. Sequence has all identical values")
    else:
        while userEntry != 0:
            if userEntry > maximum:
                sndMax = maximum
                maximum = userEntry
            elif userEntry > sndMax and userEntry != maximum:
                sndMax = userEntry
            userEntry = int(input("? "))
        print("The maximum value is", maximum)
        print("The second maximum value is", sndMax)
        
{% endJDoodle %}
{% endSolution %}


## Better input validation with while loops

* In previous examples, when invalid input is detected, the program simply terminates, eventually printing some message stating the input validity issue. The user needs to restart the program for another chance of entering correct input.
* In the case of multiple user inputs to the program, this can cause an inconvenience; if the invalid entry happens after many other valid ones, the user has to reenter even the valid inputs
* A better approach is to give the user the chance to reenter each input, when it is found to be invalid

### Exercise: Graceful input validation

Write a program which keeps prompting the user for an integer in the range [0..255] until the user input is valid, then prints the binary representation of the number.


{% empty_jdoodle %}

{% Solution %}
{% JDoodle %}
userInput = -1
while userInput < 0 or userInput > 255:
    try:
        userInput = int(input("Please enter an integer number in the range [0..255]: ")) 
        if userInput < 0 or userInput > 255:
            print("Number is out of range")          
    except ValueError:
        print("This is not an integer number.")
print(bin(userInput))
{% endJDoodle %}

Another solution
{% JDoodle %}
userEntry = -1
while userEntry < 0 or userEntry > 255:
    try:
        userEntry = int(input("Please type an integer in [0..255]: "))
    except ValueError:
        pass # just keep asking without informing about the issue
print(bin(userEntry))
{% endJDoodle %}
{% endSolution %}

## "break" from a loop

```
<statements_before_while>
while <conditional_expression>:
    <loop_body_part_1>
    if <other_conditional_expression>:
        break
    <loop_body_part_2>
<statements_after_while>
```

The `break` construct interrupts all iteration: `<loop_body_part_2>` is skipped and execution carries on directly to `<statements_after_while>`

### Example: Maximum of a sequence using `while` and `break`

{% JDoodle %}
print("This program finds the maximum of a sequence of integers")

print("Please enter integers at the prompt. Enter 0 to terminate the sequence")
userEntry = int(input("? ")) # this is needed to initialize the maximum
if userEntry != 0:
    maximum = userEntry
    while True:
        userEntry = int(input("? ")) # can now be at the top of the loop body
        if userEntry == 0:
            break
        if userEntry > maximum:
            maximum = userEntry    
    print("The maximum value is", maximum)
else:
    print("No maximum found. The sequence is empty")
{% endJDoodle %}

## "continue" to the next loop iteration

```
<statements_before_while>
while <conditional_expression>:
    <loop_body_part_1>
    if <other_conditional_expression>:
        continue
    <loop_body_part_2>
<statements_after_while>
```

The `continue` construct interrupts only the current iteration: execution carries on with reevaluating the `<conditional_expression>`, and eventually the next iteration.

### Exercise: Average of a sequence of number

Write a program that computes the average of a user-prompted sequence of floating point numbers. The average computation, more specifically the summation, should be achieved using an accumulator (no need to aggregate the values),  ignoring any non-numerical entry . The user needs to enter the string "q" or "Q" to signal the end of the sequence of numbers.

Here is a sample run:

```
This program computes the average of a set of numbers
Please enter one number at each prompt. Enter q or Q to stop prompting and get the result
? 2.1
? 3.6
? hello
You entered a non numerical value. This entry will be ignored
? 4.6
? 2
? q
The average of this set of values is: 3.075
```

{% empty_jdoodle %}

{% Solution %}
{% JDoodle %}
print("This program computes the average of a set of numbers")
print("Please enter one number at each prompt. Enter q or Q to stop prompting and get the result")

sumOfEntries = 0
countOfEntries = 0
while True:
    userEntry = input("? ")
    if userEntry == 'q' or userEntry == 'Q':
        break
    try:
        numEntry = float(userEntry)
    except ValueError:
        print("You entered a non numerical value. This entry will be ignored")
        continue # to the next iteration, skipping the remainder of the current one
    sumOfEntries += numEntry
    countOfEntries += 1

if countOfEntries:  # if countOfEntries != 0 :
    averageOfEntries = sumOfEntries / countOfEntries
    print("The average of this set of values is:", averageOfEntries)

{% endJDoodle %}

Another solution
{% JDoodle %}
print("This program computes the average of a set of numbers")
print("Please enter one number at each prompt. Enter q or Q to stop prompting and get the result")

sumOfEntries = 0
countOfEntries = 0
userEntry = input("? ")
while userEntry != 'q' and userEntry != 'Q':
    try:
        numEntry = float(userEntry)
        sumOfEntries += numEntry
        countOfEntries += 1
        userEntry = input("? ")
    except ValueError:
        print("You entered a non numerical value. This entry will be ignored")
    
if countOfEntries:  # if countOfEntries != 0 :
    averageOfEntries = sumOfEntries / countOfEntries
    print("The average of this set of values is:", averageOfEntries)

{% endJDoodle %}

{% endSolution %}
