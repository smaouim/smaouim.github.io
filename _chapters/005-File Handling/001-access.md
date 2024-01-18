---
title: Accessing files
slug: file-access
abstract:
---

## Console applications

* All _**input**_ is entered by a user in the keyboard
    * Using `input()` function
* All _**output**_ is displayed on the screen and can only be read by the user at that point
    * Using `print()` function
* Implications:
    * Human-application interaction is significant
    * Long term storage of results is not straight forward

## Computational applications

* Consider, as an example, an application performing geophysical simulation to detect the presence of oil in the ground
    * The application requires as input, "imagery" data of multiple ground layers over large areas
    * The application will produce an estimation of the distribution of oil in the different portions
* The console Input / Output (I/O) mode is not sustainable for such applications, that are requiring significant amount of input data and producing significant amount of outputs
    * Entering input data to the keyboard can take a very long time or impossible due to tricky format
    * The data may already exist on the computer as a digital file
    * The user may not be able to consult and use all output as soon as they are on screen in one sitting
    * It is important to keep records of multiple outputs for comparison, archiving, etc.

## Files

* Data can be stored "permanently" on _**secondary storage**_ of computer systems
* The basic unit of long term data storage is the _**file**_
* The file system is the component of the computer's operating system, responsible for managing files on the different secondary storage devices (local hard drive, network drive, removable drive, etc.)

## Operations on files

* Programs can send requests to the file system to:
    * Create new files on a drive
    * Read from existing files
    * Modify existing files
* As such, a program can:
    * read input from one or multiple files
    * Write output to one or multiple files
    * Write data to and read data from temporary files, at different stages of solving the problem.
* Programming languages offer a set of objects and functions are to perform these operations in programs
* From a program's point of view a file can be abstracted as a sequence of bytes
* The simplest files are (raw) **text** files where each byte is interpreted as a **character**
    * The content of such files can be examined by a human user, when opened using a simple text editor like notepad, gedit, etc.
* Byte sequences corresponding to files like printable documents (pdf) or worksheets (xlsx), which contain formatted text, images, etc. are not necessarily human-readable if interpreted as characters. Each byte may represent either content or formatting information, according to the file format. Special programs, like word processors, interpret the sequence of byte according to the file format and generate the human-readable content of such file, which is then displayed via a graphical interface.

## File access

* In order to read or write to a file, the program needs to `open()` the file.
* Opening the file consists in creating a **"file object"**, associated with the file location in the file system (hard drive, network drive , etc.)
* The file is designated by its **name** (if it is in the working directory) or **path** only at opening.
* `read()` and `write()` operations can only be done on a file object obtained by an `open` operation.
* When opening a file, few parameters have to be specified:
    * **file name** (more generally, path): a string containing the name or path of the file
    * **mode**: an optional string specifying whether the file is to be opened for reading, writing or appending. The default mode is reading. Multiple modes can be specified.
    * **multiple other optional arguments**: [see documentation](https://docs.python.org/3/library/functions.html#open)

#### Open modes:

Mode | Description |
--- | --- |
"r" or "rb" | Reading: OK, at the current read position<br>Writing: error<br>File exists: open as-is <br>File does not exist: error<br>Initial read position: 0 i.e. beginning of the file
"w" or "wb" | Reading: error<br>Writing: OK, at the current write position<br>File exists: open and erase/empty<br>File does not exist: create new empty<br>Initial write position: 0 i.e. beginning (file is empty anyway)
"a" or "ab" | Reading: error<br>Writing: OK, always at the end of file (append)<br>File exists: open as-is<br>File does not exist: create new empty<br>Initial write position: end-of-file
"[m]+" or "[m]+b" | Reading: OK<br>Writing: OK<br>File existence and initial read/write position apply as above depending on [m]

"[m]b" : for reading and writing bytes (binary sequences), instead of strings

* After completing the needed reading and/or writing, the file _**must**_ be closed.
    * guarantees that (buffered/delayed) modifications to files complete before needed data is erased from program memory
* Once closed, the file object cannot be used for read/write operations on the previously opened file.
* Like other identifiers, file object identifiers can be reused to open other files or designate other objects
    * if the file object was closed, reuse is safe
    * if the file object was not closed, access to the file is lost and previous file modifications may not complete safely.
* **File access sequence:**
    * open
    * (multiple) read/write/reposition
    * close
* Alternatively, use `with` keyword (see example)


## Reading from text files

* The file has to be opened in read mode.
* The file object method `read()` returns a string object.
    * when called without arguments, the string corresponds to the whole content of the file
    * optional arguments and their effects, other reading and repositioning functions will be discussed later.

input.txt
```
This is a sample input file.
```

{% JDoodle %}
inputfile1 = open("input.txt", "r")
content = inputfile1.read()
print(content)
#inputfile1.write("Hello")  # errors out
inputfile1.close()
#inputfile1.read() # errors out

{% endJDoodle %}

{% JDoodle %}
inputfile2 = open("test.txt") # errors out because the file does not exist
print(inputfile2.read())
inputfile2.close()
{% endJDoodle %}

{% JDoodle %}
# alternatively
with open("input.txt") as inputfile1:
    print(inputfile1.read())

print(inputfile1.closed)
{% endJDoodle %}

## Writing to files

* The file has to be opened in write or append mode.
* The file object method `write()` takes as argument a string object.
    * other writing and repositioning functions will be discussed later.

{% JDoodle %}
outputfile1 = open("output.txt", "w")
outputfile1.write("This is a sample output file. ")
outputfile1.close()


{% endJDoodle %}

{% JDoodle %}
outputfile2 = open("output.txt", "a")
outputfile2.write("Appending text to the sample output file.")
outputfile2.close()

{% endJDoodle %}

{% JDoodle %}
with open("other_output.txt", "a") as ofile:
    ofile.write("File did not exist. Creating and appending.")
    

{% endJDoodle %}

{% JDoodle %}
with open("existing.txt", "w") as ofile:
    ofile.write("erasing and writing again.")


{% endJDoodle %}

## Practice: copying a file

write a program where you

* prompts the user for an existing file name
* if the file exists, creates a copy of the file. The name of the copy is the given file name prefixed with "copy_of_"
* if the file does not exist, print the message "File does not exist"

{% empty_jdoodle %}

{% Solution %}
{% JDoodle %}
inFilename = input("Please enter the name of the file to copy: ")

try:
    infile = open(inFilename)
    content = infile.read()
    infile.close()
    outFilename = "copy_of_" + inFilename
    outfile = open(outFilename, "w")
    outfile.write(content)
    outfile.close()
except FileNotFoundError:
    print("File does not exist")

{% endJDoodle %}
{% endSolution %}

## Practice: numerical input from text file

Write a program which:

* reads from the file matrix.dat a sequence of space-separated floating point numbers, assumably representing the elements of a square matrix.
    * if any of the elements is not a floating point number or the number of elements is not a perfect square, print the message "Cannot be formatted as a square matrix"
* rewrites the file matrix.dat with the elements of the matrix aligned in rows and (left-justified) columns. The elements of a row must be spaced by at least 2 spaces.

> * Just like console input, a program has some expectation on the contents of a file. Thus, it should, **eventually**, include handling of cases where the expectation is not met i.e. invalid input.
> * When a given file is going to be overwritten, make a copy of the original file, for debugging purposes.
{: .block-tip }

matrix.dat:

```
2.6 196.475 78.8954 10 91.6 0.52 7854 85.147 62 45
```

{% empty_jdoodle %}

{% Solution %}
{% JDoodle %}
# reading data from file
infile = open("matrix.dat")
matrixData = infile.read()
infile.close()
# if data were to be read from the keyborad then we would use:
# matrixData = input("Please enter a sequence of space-separated floating point numbers: ")

matrixData = matrixData.split()
matrixFloats = []
try:
    # validating the input
    for element in matrixData:
       matrixFloats.append(float(element)) # if this fails for any element it will raise ValueError exception
    nbrElem = len(matrixData)
    if ((nbrElem ** 0.5) % 1) != 0.0:
        raise ValueError  # ValueError exception is raised if the number of elements if not a perfect square
    # generating the matrix new format (as a multi-line string)
    width = max([len(elem) for elem in matrixData]) + 2
    size = int(nbrElem ** 0.5)
    output = ""
    k = 0
    for i in range(size):
        for j in range(size):
            output += matrixData[k].ljust(width)
            k += 1
        output +="\n"
    # if output were to be written to the screen then we would use
    # print(output)
    # writing the new format to the file
    with open("matrix.dat", "w") as outfile:
        outfile.write(output)
except ValueError:
    print("Cannot be formatted as a square matrix")


{% endJDoodle %}
{% endSolution %}

## Specifying files in the file system

* When specifying a file for opening:
    * Only files in the working directory (same directory as the module) can be designated by their file name alone
    * Files in any other directory in the file system need to be specified using an _absolute_ or _relative_ path
* Most file systems organize files in a hierarchy or tree
    * The root directory of the tree is the storage device
    * Many branches / internal nodes represent the different subdirectories
    * Files are the leaves of the tree

![](/assets/images/Lec15-1.jpg)

* The location of a file is specified via its absolute path or relative path
* An **absolute path **is a sequence of directory names, starting at the root of the file system and ending at the specific file (or directory), following the relationship: "is subdirectory of"
    * e.g. in the above example file system the absolute path of `first` is: `root/spell/mail/prt/first`
    * paths are typically stored as strings
    * directory names are separated using "/" or "\", depending on the operating system
    * In Python programs, paths can always be specified using "/", regardless of the operating system
* A **relative path** is a sequence of directory names starting at the current directory and ending at the specific file, following the relationships: "is subdirectory of" or "is parent directory"
    * "../" is used to specify the parent directory, as needed to travel up the tree
    * e.g. in the above example, the path to `spell` relative to `first` is: `../../prog/spell`

{% JDoodle %}
with open("myfiles/input1.txt") as infile:
    print("accessing file with relative path")
    print(infile.read())

with open("/usercode/myfiles/input1.txt") as infile:
    print ("accessing file with absolute path")
    print(infile.read())

with open("input2.txt") as infile:
    print("accessing file with relative path")
    print(infile.read())

with open("/usercode/input2.txt") as infile:
    print ("accessing file with absolute path")
    print(infile.read())
{% endJDoodle %}