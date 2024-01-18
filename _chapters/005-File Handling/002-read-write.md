---
title: Reading, writing and repositioning
slug: read-write
abstract:
---

## Controlling the stream position

* The stream position determines at which character the next read or write operation will start
* It is set initially to
    * 0 (beginning of the file) when the file is opened in `'r'` or `'w'` modes
    * the end of the file when the file is opened in `'a'` mode
* It is updated after each read/write operation to the position at which the operation has ended
* `file.tell()`:  returns the current stream position
* `file.seek(offset [, ref])`  changes the stream position by `offset` from `ref`
    * `ref` can be 0 (default) for the beginning of the file
    * `ref` can be 1 for the current position, `offset` has to be 0 for text files thus resulting in no-operation
    * `ref` can be 2 for the end-of-file, `offset` has to be 0

out.txt
```
test writing le I/O is not hard but requires more patience. test writing again test writing
```
{% JDoodle %}

with open("out.txt", "w") as myfile:
    print("Stream position when opening in 'w' mode:", myfile.tell())
    content = "Learning file I/O is not hard but requires patience."
    print("Length of text to be written:", len(content))
    myfile.write(content)
    print("Stream position after writing:", myfile.tell())
    myfile.write("writing again.")
    print("Stream position after writing:", myfile.tell())

{% endJDoodle %}

{% JDoodle %}
with open("out.txt", "w+") as myfile:
    print("Stream position when opening in 'w+' mode:", myfile.tell())
    content = myfile.read()
    print("Initial file content:", content)
    print("Stream position after read:", myfile.tell())
    content = "Learning myfile I/O is not hard but requires more patience. "
    print("Writing to file:", content)
    myfile.write(content)
    print("Stream position after writing:", myfile.tell())
    myfile.seek(0)
    print("Stream position after seek(0):", myfile.tell())
    print("text read from file:", myfile.read())
    print("Stream position after read:", myfile.tell())

{% endJDoodle %}

{% JDoodle %}
with open("out.txt", "r") as myfile:
    print("Stream position when opening in 'r' mode:", myfile.tell())
    content = myfile.read()
    print("Length of text read from file:", len(content))
    print("Stream position after reading:", myfile.tell())



{% endJDoodle %}

{% JDoodle %}
with open("out.txt", "a+") as myfile:
    print("Stream position when opening in 'a+' mode:", myfile.tell())
    print("text read at current position:", myfile.read())
    print("Stream position after read:", myfile.tell())
    content = "test writing "
    print("Writing to file at current position:", content)
    myfile.write(content)
    print("Stream position after writing: ", myfile.tell())
    myfile.seek(0)
    print("Stream position after seek(0)", myfile.tell())
    content = "again test writing"
    print("Writing to file at current position:", content)
    myfile.write(content)
    print("Stream position after writing: ", myfile.tell())

{% endJDoodle %}

{% JDoodle %}
with open("out.txt", "a") as myfile:
    print("Stream position when opening in 'a' mode:", myfile.tell())
    content = "Showing how tell() works."
    print("Length of text to be written:", len(content))
    myfile.write(content)
    print("Stream position after writing:", myfile.tell())


{% endJDoodle %}

### Exercise:

Write a program where you print to the screen the second half of the text in the provided file twinkle.txt, **without reading the first half**.

twinkle.txt
```
Twinkle, twinkle, little bat!
How I wonder what you're at!
Up above the world you fly,
Like a teatray in the sky.
```
{% empty_jdoodle %}

{% Solution %}
{% JDoodle %}
file = open("twinkle.txt")
file.seek(0, 2)
nChar = file.tell()
file.seek(nChar//2)
s = file.read()
print(s)
file.close()
{% endJDoodle %}
{% endSolution %}


## Reading methods

* `s = file.read([size])`
    * `size` specifies the number of characters to read
    * If `size` is not specified or negative, returns a string with all the characters in the file until the end-of-file (EOF)
* `s = file.readline([size])`
    * Returns a string containing the characters up to the next new line character from the file
* `L = file.readlines([size])`
    * Returns a list of strings where each is a line from the file
* `size` _always represents the maximum number of characters to be read. If less characters are left till the end of line or end of file, then shorter strings are returned._
* `for line in file:`
    * Iterate through lines of the file using a for loop
* All read operations start from the current stream position.
* The stream position is incremented by the number of characters read


{% JDoodle %}
with open("twinkle.txt") as infile:
    print(len(infile.read(10))) # reading the first 10 charcters
    infile.seek(0)
    print(len(infile.read(500))) # the file has less than 500 characters
    infile.seek(0)
    print(infile.readline()) # reading the first line
    infile.seek(0)
    line = infile.readline(15) # reading up until the end of the first line or 15 characters
    print(line, len(line)) 
    infile.seek(0)
    line = infile.readline(100) # reading up until the end of the first line or 100 characters
    print(line, len(line)) 
    infile.seek(0)
    print(infile.readlines())
    infile.seek(0)
    print(infile.readlines(10))
    infile.seek(0)
    print(infile.readlines(50))
    infile.seek(0)
    print(infile.readlines(200))
    infile.seek(0)
    for line in infile:
        print(line)
{% endJDoodle %}


## Writing methods

* `file.write(content)`
    * `content`  must be a string
* `file.writelines(list_of_content)`
    * `list_of_content`  must be a list of strings
    * the function does **NOT** add new line characters at the end of each string in the list
* All write operations start from the current stream position (in `"w"` and `"w+"` modes)
* The stream position is incremented by the number of characters written
* If the stream position is not at the end-of-file, the write operation **overwrites** the bytes at the current position, when in `'w'` and `'w+'` mode.
* Regardless of the current stream position, write operations will always happen at the end of file, if in `'a'` or `'a+'` mode.

{% JDoodle %}
text = ["Twinkle, twinkle, little bat!", "How I wonder what you're at!\n", "Up above the world you fly,", "Like a teatray in the sky."]
with open("Twinkle.txt", "w") as outfile:
    outfile.write("The twinkle poem\n")
    outfile.writelines(text)

{% endJDoodle %}

### Exercise:

Write a program which rewrites the file Twinkle.txt while reversing the characters of each line.

{% empty_jdoodle %}

{% Solution %}
{% JDoodle %}
# preferred approach
with open("Twinkle.txt") as infile:
    lines = infile.readlines()

with open("Twinkle.txt", "w") as outfile:
    for line in lines:
        if line[-1] == "\n":
            line = line.rstrip("\n")
            line = line[::-1]
            line += "\n"
        else:
            line = line[::-1]
        outfile.write(line)
        


# alternate approach
with open("Twinkle.txt", "r+") as infile:
    position = infile.tell()
    for line in infile:
        if line[-1] == "\n":
            line = line.rstrip("\n")
            line = line[::-1]
            line += "\n"
        else:
            line = line[::-1]
        infile.seek(position)
        infile.write(line)
        position = infile.tell()
{% endJDoodle %}
{% endSolution %}


## File and functions

* A file can be opened, read or written, then closed within a function
    * The file object is a local variable
    * The function can obtain the file path as an argument, or eventually generate it , depending on the need
* A function can also perform operations on a **file object/stream** provided as argument
    * The file object/stream is mutable
    * any read/write operation performed in the function will take effect on the file
    * modifications to the stream position due to such operations should be taken into consideration in the calling code
    * It is possible to check whether the file is readable or writable before attempting the corresponding operation or use try-except to catch potential exceptions


{% JDoodle %}
def createListFile(L, filename):
    outfile = open(filename, "w")
    outfile.write(str(L))
    outfile.close()



def appendListToFile(L, outfile):
    try:
        outfile.seek(0, 2)
        outfile.write(str(L))
    except:
        print("Could not write to file")


L1 = [1, 2, 3, 4]
L2 = [5, 6, 7, 8]

createListFile(L1, "listFile.txt")

myfile = open("listFile.txt", "r+")
appendListToFile(L2, myfile)
myfile.close()
{% endJDoodle %}

## Other useful methods
* `file.readable()`: returns True, if the file can be read
* `file.writable()`: returns True, if the file can be written to
* `file.truncate([size])`: resizes the file to the given size in bytes (or the current position if size is not specified). The current stream position isn’t changed. This resizing can extend or reduce the current file size. In case of extension, the contents of the new file area depend on the platform (on most systems, additional bytes are zero-filled). The new file size is returned.