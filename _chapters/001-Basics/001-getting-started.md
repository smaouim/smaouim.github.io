---
title: Getting started
slug: getting-started
abstract: How does a computer work? What is programming? "Hello world!" and more.
---

## Why programming?

Computers are NOT intelligent machines:

* They cannot solve (computational) problems independently
* They can only execute instructions (orders) provided by humans
* They do execute instructions very fast

**Programming** is specifying a sequence of instructions or steps for the computer to execute, in order to solve a problem. It has two major components:

* Designing a step-by-step procedure to solve the problem: **Algorithm**
* Communicating the steps or instructions to the computer hardware: **Coding**

## The language gap

* Humans communicate with each other using **natural language** (Arabic, English, French, …)
* Natural language is **ambiguous**, not precise, prone to **interpretation** using external cues (tone, context, facial expressions, etc.): it requires **intelligence**
* Computers only understand and execute a **limited** and very **specific** set of arithmetic and logic **instructions** (additions, multiplications, comparisons, etc.)
* Expressing an algorithm using the simple, fine-grained, computer hardware instructions is very **tedious** for humans

## Bridging the gap with programming languages

* The **syntax** of a language determines the valid ways of putting words and symbols together
* The **semantics** of a language are the meanings expressed by putting words and symbols together

High-level programming languages are designed such that:

* they provide **high-granularity** constructs to express algorithms with **short** and **human-friendly** texts (though still called “codes”)
* a **syntactically** valid statement has only one **semantic** interpretation

Programmers can then easily express algorithms in a form that can be **automatically converted** into machine instructions: compilation or interpretation

## Compilation vs Interpretation

* Compilers and interpreters are both software that **translate source codes** (programs expressed in high-level languages) into **machine codes** (AKA binary codes)
* A compiler produces a standalone executable program (binary code), that is subsequently loaded by the operating system and runs on the hardware independently, without further intervention from the compiler
* The (compiled) executable program can live and run on a computer that hosts neither the source code nor the compiler.

![](/assets/images/Lec1-1.png)

* An interpreter produces instructions corresponding to one high-level statement, which are then executed, before proceeding to the next statement. 
* An (interpreted) code is kept only in its original (source) form and can only be executed on a computer that hosts and runs the interpreter.

![](/assets/images/Lec1-2.png)

## Programming environment
In principle, a programmer needs only:

* a text editor to create, open, modify and save source codes (which are actually text files with special extensions)
* a compiler or interpreter to convert (and run) the source code, invoked from a command line shell

An **Integrated Development Environment (IDE)** is a software with a Graphical User Interface, including tools like:

* an advanced text editor with syntax highlighting, line numbering, autocompletion, etc.
* a compiler and run utility or an interpreter
* a debugger
* a command line shell
* a file system explorer
* a package manager
* and more …

To develop multi-file codes for large applications, it is recommended to use a standalone (desktop application) IDE like Visual Studio Code, Spyder, PyCharm, etc. 

Beginner learners can quickly get started on an online IDE available on websites like programiz.com, replit.com, online-python.com, onlinegdb.com, etc. or the ones embedded in this course pages. 

## Hello world!

* First program to write when learning a new programming language
* Program simply prints to the screen (console) the phrase “Hello world!”
* Best way to test a fresh installation of a standalone IDE

Here is our first IDE with a “Hello world!” Python program. Click the "Execute" button and notice the effect.

{% JDoodle %}
print("Hello, world! This is Python 3!")
{% endJDoodle %}

* The program consists of a single `print` **statement**.
* print is a built-in **function** that performs text **output** to the console
* The text to be printed has to be specified between quotes and passed as **argument** to the function, using parenthesis.

## Importance of correct syntax

In the above IDE, try running the code after

* removing the double quotes after the phrase
* removing the closing parenthesis

When something is wrong with the code, you get a message from the interpreter indicating what went wrong. 
In these cases, it's a `SyntaxError`, indicating that the code was not written in the proper format (missing closing quotes or parenthesis).

## Comments

Run the following program and notice the result:

{% JDoodle %}
#print("This is a comment")
print("This is not a comment")
{% endJDoodle %}


* Any line which starts with a # character is a **comment** and is ignored by the interpreter: it will not check its syntax correctness, will not try to translate it into machine instructions and will not execute it
* Comments are destined for code readers including the code writer himself/herself, collaborators, etc.
* Their main purpose is to **inform about** the source code
  * commenting is also heavily used in **debugging** code, mainly disabling few lines to exclude potential error sources