---
title: Classes and Objects 
slug: classes-objects
abstract:
---


## What are objects?

* Objects are representations of concepts in a program: person, car, bank, student, shape, device, file, signed whole number, etc.
* An object has two inseparable aspects:
  * has properties AKA  _**attributes**_
  * performs or undergoes actions AKA  _**methods and operations**_
* A concept can have a _infinity_ of attributes and operations. E.g. Person:
  * first name, last name, phone number, address, height, weight, eye color, skin color, blood type, nationality, family members, etc.
  * register birth, walk, sleep, study, visit doctor, open bank account, etc.
* When an object is used in an application, only attributes and operations relevant to the application need to be defined. E.g.: Consider an application for managing a **car repair shop** and an application for managing a **transportation department**. Since both applications deal with cars, each application can define objects representing cars. The car repair shop app will record mostly technical attributes of the car, including issues to be repaired, parts to be replaced, costs, etc. Whereas, the transportation department app will record attributes like plate number, first date of circulation, ownership, insurance status, registration status, etc.
* An object in a program is an  **abstraction**  of a concept

## What are types?

* In a an application, many objects may have the same attributes (with different values) and operations. E.g. All (objects representing) cars in the transportation department app will have the same set of attributes, among which is the plate number. Each car however will have a different value for the plate number.
* Objects with the same attributes and operations have the same type or class
* Some types are built-in i.e. defined by the programming language:
  * integers, floats, strings, lists, tuples, file objects, etc.
* A programmer can define custom types which are abstractions of concepts relevant to his/her application:
* car repair shop, car, truck, repairman, replacement part, repair order, client, etc.
* The  `class`  construct is used to define new types.

## Built-in types

* The simplest types are integers and floats :
  * The value is the one intrinsic attribute
  * Most operations are expressed via operators
  * Value and most operations are implemented in hardware
  * They are the bases for almost every other type
* Strings, tuples, lists, etc. are compound types:
  * They have multiple attributes: number of elements, types of elements, file descriptor, access mode, etc.
  * Some operations are expressed via operators but many via methods: s.sort(), l.reverse(), f.write(), etc.
  * The exact attributes are usually unknown, hidden to programmers
* Programmers are interested in how to use (interface) these types rather than how there are made-up (implementation details):  **encapsulation principle**

## Custom types: classes

* The `class` construct is used to **draw a blueprint** of a type but does not create any object.
  * similar to when `def` is used to define how a function would work
* The simplest class is where we define only attributes, no operations or methods
* An object is only created when it is given an identifier
  * Just like a function is only executed when it is called
* When an object is created, then its attributes, as defined in the class, are created and then can be accessed
  * Note that attributes need to have initial values
* Accessing attributes from outside the class can be done using the selection operator .
  * This is not the best practice though, as in most cases it is contradictory to the **encapsulation** concept.

{% JDoodle %}
class Character:
    name = "Steve Rogers"
    age = 95
    height = 1.85


captainAmerica = Character()
print("Captain America:")
print(captainAmerica)
print(captainAmerica.name)
print(captainAmerica.age)
print(captainAmerica.height)


print()
theHulk = Character()
print("The hulk:")
print(theHulk)
print(theHulk.name)
print(theHulk.age)
print(theHulk.height)

print()
print("Fixing the hulk attributes:")
theHulk.name = "Bruce Banner"
theHulk.age = 49
theHulk.height = 2.4

print("The hulk:")
print(theHulk.name)
print(theHulk.age)
print(theHulk.height)

{% endJDoodle %}


## Methods

* Functions defined within a class
* Called just like accessing an attribute (but with parenthesis)
* Takes one  **compulsory**  parameter:  `self`
  * Refers to the object, instance of the class
  * Used to access the attributes of that object from within the function

{% JDoodle %}
class Character:
    name = "Steve Rogers"
    age = 95
    height = 1.85

    def IDCard(self):
        print("Name:", self.name)
        print("Age:", self.age)
        print("Height", self.height)


captainAmerica = Character()
print("Captain America:")
print(captainAmerica)  # does not print anything about the attributes
captainAmerica.IDCard()  # a method that explicitly prints the attributes in a certain format

theHulk = Character()
theHulk.name = "bruce banner"
theHulk.age = 49
theHulk.height = 2.4
theHulk.IDCard()

# this is a free function which takes as parameter a Character object
def editCharacter(superhero):
    superhero.name = superhero.name.upper()

editCharacter(theHulk)
theHulk.IDCard()  # object was mutated by the function
{% endJDoodle %}


## Constructor


* It is unpractical to instantiate an object with default attribute values then modify them
* A constructor:
  * special method named `__init__(self, …)`
  * Called **implicitly** when an object is instantiated
  * Main objective is to create attributes which initial values are provided at instantiation as arguments

{% JDoodle %}
class Character:
    def __init__(self, initialName, initialAge, initialHeight):
        # attributes are defined here
        self.height = abs(initialHeight)
        self.name = initialName.upper()
        self.age = round(initialAge)


    def IDCard(self):
        print("Name:", self.name)
        print("Age:", self.age)
        print("Height", self.height)


captainAmerica = Character("steve rogers", 95, 1.85)
print("Captain America")
captainAmerica.IDCard()
theHulk = Character("Bruce Banner", 49.5, -2.4)
print()
print("The Hulk")
theHulk.IDCard()
# still can access each attribute directly using selection
print("Changing captain america's name. Current name:", captainAmerica.name)
captainAmerica.name = 2  # !!!!!!!!!
print("new name:", captainAmerica.name)

{% endJDoodle %}


## Practice: The Fraction class

* Write the implementation of a class called  `Fraction` that represents rational numbers, with respect to the following guidelines:
  * has two integer attributes: a numerator and a denominator set by the constructor
  * has a method that returns the quotient of the numerator and denominator as a floating point number
  * Has a method that prints the fraction in the format: numerator / denominator
  * has a method that adds to the fraction an integer and returns the result as a new fraction
  * has a method that adds to the fraction another fraction and returns result as a new fraction

{% empty_jdoodle %}

{% Solution %}
{% JDoodle %}
class Fraction:
    def __init__(self, numerator, denominator):
        self.num = numerator
        self.denom = denominator
    
    def quotient(self):
        return self.num / self.denom

    def printFraction(self):
        print(self.num, "/", self.denom)

    def add_int(self, operand):
        # result = Fraction(1, 1)
        # result.denom = self.denom
        # result.numr = self.num + operand * self.denom
        # return result
        otherFraction = Fraction(operand, 1)
        return self.add_fraction(otherFraction)
    
    def add_fraction(self, operand):
        denominator = self.denom * operand.denom
        numerator = self.num * operand.denom + operand.num * self.denom
        return Fraction(numerator, denominator)


    def accumulate(self, operand):
        self.num = self.num * operand.denom + operand.num * self.denom
        self.denom = self.denom * operand.denom

F1 = Fraction(3, 4)
print("F1 = ", end="")
F1.printFraction()
F2 = Fraction(5, 6)
print("F2 = ", end="")
F2.printFraction()
F3 = F1.add_fraction(F2)
print("F1 = ", end="")
F1.printFraction()
print("F2 =", end="")
F2.printFraction()
print("F3 = ", end="")
F3.printFraction()
F1.accumulate(F2)
print("F1 = ", end="")
F1.printFraction()
F4 = F2.add_int(2)
print("F4 = ", end="")
F4.printFraction()
{% endJDoodle %}
{% endSolution %}

## Getter and Setter methods

* Attributes may require to have specific format or range
* While the class should maintain these invariants at all times, assigning values to attributes outside the class functions may inadvertently violate these rules
* Class can implement those rules by defining getter and setter methods for all or select attributes
* Using getters and setters is a better practice than accessing attributes directly
  * Still, defining them does not compel programmers to use them and prevent from directly assigning values to attributes

{% JDoodle %}
class Character:
    def __init__(self, initialName, initialAge, initialHeight):
        self.height = abs(initialHeight)  # height has to be always positive
        self.name = initialName.upper()  # name has to be always upper case
        self.age = round(abs(initialAge))   # age has to be always positive integer)

    def IDCard(self):
        print("Name:", self.name)
        print("Age:", self.age)
        print("Height", self.height)

    def set_name(self, newName):
        self.name = newName.upper()

    def set_age(self, newAge):
        self.age = round(abs(newAge))

    def set_height(self, newHeight):
        self.height = abs(newHeight)

    def get_name(self):
        return self.name

    def get_age(self):
        return self.age

    def get_height(self):
        return self.height


captainAmerica = Character("Steve Rogers", 95, 1.85)
print("Captain America:")
captainAmerica.IDCard()
captainAmerica.set_age(100)
captainAmerica.IDCard()

theHulk = Character("Bruce Banner", 49, 2.4)
print("The hulk:")
theHulk.IDCard()
theHulk.set_age(49.5)
theHulk.IDCard()

# however, we still can assign new attribute values directly
# ignoring the class rules for those attributes
# this can eventually create errors, if some object operations
# rely on those rules for correctness
theHulk.name = "green man"
theHulk.age = -2.2
print("The hulk:")
theHulk.IDCard()

{% endJDoodle %}


## Practice: Fraction class, continued

* Modify the implementation of the class `Fraction` that represents rational numbers, with respect to the following guidelines:
  * A fraction has two integer attributes: a numerator and a denominator such that:
    * The fraction is **always** reduced to lowest terms E.g. if the initial numerator is 6 and the initial denominator is 12, they must be transformed into 1 and 2.
    * If the fraction is negative, the sign **must** show up in the numerator E.g. if the initial numerator is 15 and the initial denominator is -20, they should be transformed into -3 and 4.
  * The constructor should take two integer values (numerator and denominator) as arguments and perform the reduction and sign adjustment as needed
  * Implement setters which maintain the same rules (invariants) when either the numerator or the denominator changes
  * reduction to lowest terms and sign adjustment can be done by a separate method, which would be called from the constructor and from the setters.
    * reduction to lowest terms requires dividing each of the numerator and denominator by their Greatest Common Divisor (GCD)
    * the `math` package provides a function that computes the GCD of two numbers, look it up.
  
{% empty_jdoodle %}


{% Solution %}
{% JDoodle %}
import math

class Fraction:
    def reduce(self):
        if self.denom < 0:
            self.denom *= -1
            self.num *= -1
        div = math.gcd(self.num, self.denom)
        self.num //= div
        self.denom//= div

    def __init__(self, numerator, denominator):
        self.num = numerator
        self.denom = denominator
        self.reduce()

    def set_numerator(self, newNumerator):
        self.num = newNumerator
        self.reduce()

    def set_denominator(self, newDenominator):
        self.denom = newDenominator
        self.reduce()

    def get_numerator(self):
        return self.num

    def get_denominator(self):
        return self.denom

    def printFraction(self):
        print(self.num, "/", self.denom)

    def add_int(self, operand):
        # result = Fraction(1, 1)
        # result.denom = self.denom
        # result.num = self.num + operand * self.denom
        # return result
        return self.add_fraction(Fraction(operand,1))
    
    def add_fraction(self, operand):
        denominator = self.denominator * operand.denominator
        numerator = self.numerator * operand.denominator + operand.numerator * self.denominator
        return Fraction(numerator, denominator)

    

F1 = Fraction(-2, -24)
print("F1 = ", end="")
F1.printFraction()
print(f"{F1.num =}, {F1.denom =}")
F1.num = 36
print(f"{F1.num =}, {F1.denom =}")
F1.set_numerator(36)
print("F1 = ", end="")
F1.printFraction()
print(f"{F1.num =}, {F1.denom =}")
F1.set_denominator(-15)
print("F1 = ", end="")
F1.printFraction()
print(f"{F1.num =}, {F1.denom =}")

{% endJDoodle %}
{% endSolution %}

## Special (magic) methods for object representation

* `__str__(self)` and `__repr__(self)`: both return a string representation of the object
  * `__str__`: returns an informal string representation of the object, used for creating output for end user.
  * `__repr__`: returns the "official" string representation of the object, mainly used for debugging and development

{% JDoodle %}
class Character:
    def __init__(self, initial_name, initial_age, initial_height):
        self.height = abs(initial_height)  # __height has to be always positive
        self.name = initial_name.upper()  # __name has to be always upper case
        self.age = round(initial_age)    # __age has to be always integer

    def __str__(self):
        return "Name : {}\nAge : {}\nHeight: {}".format(self.name, self.age, self.height)

    def __repr__(self):
        return "Character(name = {}, age = {}, height = {})".format(self.name, self.age, self.height)

captainAmerica = Character("Steve", 95, 1.85)
theHulk = Character("Bruce banner", 49, 2.4)
blackWidow = Character("Natasha Romanoff", 36, 1.5)
theAvengers = [captainAmerica, theHulk, blackWidow]
print(captainAmerica)
card = str(theHulk)
print(card)
print(repr(blackWidow))
print(theAvengers)

{% endJDoodle %}


## Special methods for overloading operators and built in functions

* Implementing these functions for a class allows to use the objects in arithmetic expressions or in comparison expressions or with built-in functions.
* **Special methods are only implemented when they make sense. E.g. classes that emulate numerical concepts or containers**

![](/assets/images/Lec16-1.png)
![](/assets/images/Lec16-2.png)
![](/assets/images/Lec16-3.png)


## Practice: Fraction class, overloading operators

Implement any relevant special methods for the Fraction class and experiment with using them. A sample script is given.

{% empty_jdoodle %}

{% Solution %}
{% JDoodle %}
import math

class Fraction:
    def reduced(self):
        GCD = math.gcd(self.__num, self.__den)
        self.__num //= GCD
        self.__den //= GCD
        if self.__den < 0:
            self.__num *= -1
            self.__den *= -1

    def __init__(self, numerator, denominator):
        self.__num = numerator
        self.__den = denominator
        self.reduced()

    def set_numerator(self, newNumerator):
        self.__num = newNumerator
        self.reduced()

    def set_denominator(self, newDenominator):
        self.__den = newDenominator
        self.reduced()

    def get_numerator(self):
        return self.__num

    def get_denominator(self):
        return self.__den

    numerator = property(get_numerator, set_numerator)
    denominator = property(get_denominator, set_denominator)

    def quotient(self):
        return self.__num / self.__den

    def print(self):
        print(f"{self.__num}/{self.__den}")

    def __str__(self):
        return f"{self.__num}/{self.__den}"

    def __repr__(self):
        return f"Fraction({self.__num}, {self.__den})"

    def __add__(self, operand):
        return Fraction(self.__num * operand.__den + self.__den * operand.__num, self.__den * operand.__den)

    def __mul__(self, operand):
        return Fraction(self.__num * operand.__num, self.__den * operand.__den)

    def __sub__(self, operand):
        return Fraction(self.__num * operand.__den - self.__den * operand.__num, self.__den * operand.__den)

    def __truediv__(self, operand):
        return Fraction(self.__num * operand.__den, self.__den * operand.__num)

    def __abs__(self):
        return Fraction(-self.__num, self.__den)

    def __float__(self):
        return self.__num / self.__den

    def __int__(self):
        return int(self.quotient())


F1 = Fraction(1, 2)
F2 = Fraction(3, 4)
print("F1 =", F1)
s = str(F2)
print(f"{s = } = str(F2)")
L = [F1, F2]
print(f"{L = }")
F3 = F1 + F2
print("F3 = F1 + F2 =", F3)
print("F1 - F2 =", F1 - F2)
print("F1 * F2 =", F1 * F2)
print("F1 / F2 =", F1 / F2)
print("float(F3) =", float(F3))
print("int(F3) = ", int(F3))

{% endJDoodle %}
{% endSolution %}