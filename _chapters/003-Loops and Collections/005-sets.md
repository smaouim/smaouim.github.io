---
title: Sets and Dictionaries
slug: sets
abstract: Set and Dictionary data types and their operations
---

## Sets

* Aggregate data of different types
* unordered and unindexable
* do not allow duplicates
* are mutable i.e. allow insertion and deletion of elements after creation
* elements should be hashable; immutable built-in data types are hashable but mutable types like lists and sets are not.
* typical uses are: membership testing, removing duplicates from a sequence, and (mathematical) set operations such as intersection, union, difference, and symmetric difference

### Initialization

{% JDoodle %}
s0 = set()
print(f"{s0 = }")
s1 = {"hello", 25, 3.2, (3, 4, 5)}
print(f"{s1 = }")

s2 = {1, 2, 3, 4, 3, 5, 6}
print(f"{s2 = }") # notice that duplicates are removed

#s3 = {1, 2, [3, 4]} # errors out, since [3, 4] is mutable so not hashable
s3 = {1 ,2 , (3, 4)}
print(f"{s3 = }")

l1 = ['a', 'b' , 'c', 'd']
s4 = set(l1)
print(f"{s4 = }")

t1 = ('a', 'b' , 'c', 'd')
s5 = set(t1)
print(f"{s5 = }")

str1 = "abcd"
s6 = set(str1)
print(f"{s6 = }")

l2 = list(s3)
print(f"{l2 = }")

t2 = tuple(s3)
print(f"{t2 = }")

str2 = str(s3)
print(f"{str2 = }")

{% endJDoodle %}

### Operators, functions and methods

{% JDoodle %}
s1 = {1, 2, 3, 4, 5, 6, 7, 8}
print("s1 = ", s1)
s2 = {2, 4, 6, 8}
print("s2 = ", s2)
print("s2 issubset s1 : ", s2.issubset(s1))
print("s2 <= s1 : ", s2 <= s1)
print("s2 < s1 : ", s2 < s1)
print("s1.issuperset(s2) : ", s1.issuperset(s2))
print("s1 >= s2 :", s1 >= s2)
print("s1 > s2 : ", s1 > s2)
s3 = {'a', 'b', 'c', 'd', 'e'}
print("s3 = ", s3)
print("s3.isdisjoint(s1) = ", s3.isdisjoint(s1))
print("s3.union(s2) = ", s3.union(s2))
s4 = {5, 6, 7, 8, 9, 10, 11, 12}
print("s4 = ", s4)
print("s4.intersection(s1) = ", s4.intersection(s1))
print("s4 & s1 = ", s4 & s1)
print("s4.difference(s1) = ", s4.difference(s1))
print("s4 - s1 = ", s4 - s1)
print("s4.symmetric_difference(s1) = ", s4.symmetric_difference(s1))
print("s4 ^ s1 = ", s4 ^ s1)
print("modifier methods: ")
s4.update(s3)
print("after s4.update(s3), s4 = ", s4)
s4 |= {1.2, 3.4, 5.6}
print("after s4 |= {1.2, 3.4, 5.6}, s4 = ", s4)
s4.intersection_update(s3)
print("after s4.intersection_update(s3), s4 = ", s4)
s4 &= {"c", "d", "e", "f", "g", "h", "i", "j"}
print('after s4 &= {"c", "d", "e", "f", "g", "h", "i", "j"}, s4 = ', s4)
s4.difference_update({'d', 'x', 'y', 'z'})
print("after s4.difference_update({'d', 'x', 'y', 'z'}), s4 = ", s4)
s4 -= {'e', 'l', 'p', 'q'}
print("after s4 -= {'e', 'l', 'p', 'q'}, s4 = ", s4)
s4.symmetric_difference_update({'x', 'y', 'z'})
print("after s4.symmetric_difference_update({'x', 'y', 'z'}), s4 = ", s4)
s4 ^= {"c", "p", "q"}
print('after s4 ^= {"c", "p", "q"}, s4 = ', s4)
s4.add(13)
print("after s4.add(13), s4 = ", s4)
s4.remove('p')
print("after s4.remove('p'), s4 = ", s4)
# s4.remove('a') # raises error
s4.discard('q')
print("after s4.discard('q'), s4 = ", s4)
s4.discard('a')
print("after s4.discard('a'), s4 = ", s4)
s4.pop()
print("after s4.pop(), s4 = ", s4)
s4.clear()
print("after s4.clear(), s4 = ", s4)
print("Assignment and copy")
s5 = s3
print("s5 = s3 = ", s5)
s3.add("x")
print("after s3.add('x'), s3 = ", s3, "and" , "s5 = ", s5)
s5 = s3.copy()
print("s5 = s3.copy()")
s3.add('y')
print("after s3.add('y'), s3 = ", s3, "and", "s5 = ", s5)

{% endJDoodle %}

### Exercise: remove duplicates


Write a program which

* reads in a sequence of space-separated words from the user
* prints out a list of the user entries while removing any duplicates

{% empty_jdoodle %}

{% Solution %}
{% JDoodle %}
userInput = input("enter a set of space separated words: ")
userInput = userInput.split()

noDuplicates = list(set(userInput))
print(noDuplicates)
{% endJDoodle %}
{% endSolution %}

## Dictionaries

* mapping or associative data structure i.e. elements are pairs
* keys can have different data types, but must be hashable (e.g. immutable built-in types).
* values also can have different data types and can be mutable
* no duplicate keys are allowed which allows dictionaries to be indexable by keys
* element are ordered by insertion time

### Initialization

{% JDoodle %}
o = dict()
print(f"{o = }")
o = {}
print(f"{o = }")
a = dict(one=1, two=2, three=3)
print(f"{a = }")
b = {'one': 1, 'two': 2, 'three': 3}
print(f"{b = }")
c = dict(zip(['one', 'two', 'three'], [1, 2, 3]))
print(f"{c = }")
d = dict([('two', 2), ('one', 1), ('three', 3)])
print(f"{d = }")
e = dict({'three': 3, 'one': 1, 'two': 2})
print(f"{e = }")
f = dict({'one': 1, 'three': 3}, two=2)
print(f"{f = }")
print(a == b == c == d == e == f)

{% endJDoodle %}

### Operators, functions and methods

{% JDoodle %}
d1 = {
  "brand": "Ford",
  "model": "Mustang",
  "year": 1964
}
print(f"{d1 = }")
print(f"{len(d1) = }")
print(f"{'model' in d1 = }")
print("=============================================================")
# element access
print(f"{d1['brand'] = }")
d1['year'] = 2022
print(f"after d1['year'] = 2022, {d1 =} ")
#print(f"{d1['power'] = }") # KeyError
print(f"{d1.get('model') = }")
print(f"{d1.get('power') = }") # no error
print("=============================================================")
# add and remove element
d1['power'] = 204
print(f"after d1['power'] = 204, {d1 = }")
# d1.pop('color') # KeyError
# del d1['color'] # KeyError
d1.pop('power')
print(f"after d1.pop('power'), {d1 = }")
del d1['model']
print(f"after del d1['model'], {d1 = }")
d1.popitem()
print(f"after d1.popitem(), {d1 = }") # delete in LIFO order
d1.update(color = 'red', trim = 'xyz')
print(f"after d1.update(color = 'red', trim = 'xyz'), {d1 = }")
# d2 = d1 | {'brand' : 'ford', 'model' : 'mustang'} # requires Python 3.9 and up
# print("d2 = d1 | {'brand' : 'ford', 'model' : 'mustang'} =  ", d2)
# d2 |= {'brand' : 'chevy', 'model' : 'camaro', 'title' : 'blue'}
# print("after d2 |= {'brand' : 'chevy', 'model' : 'camaro', 'title' : 'blue'}, d2 = ", d2)
print("=============================================================")
# copying and clearing
d1 = {
  "brand": "Ford",
  "model": "Mustang",
  "year": 2022
}
print(f"restored d1 to {d1}")
d2 = d1
print("d2 = d1 = ", d2)
d1['year'] = 1964
print("after d1['year'] = 1964, d1 = ", d1, 'and d2 = ', d2)
d2 = d1.copy()
print("after d2 = d1.copy(), d2 = ", d2)
d2['year'] = 2022
print("after d2['year'] = 2022, d2 = ", d2 , 'and d1 = ', d1)
d2.clear()
print("after d2.clear(), d2 = ", d2)
print("=============================================================")
# extracting data
print("list(d1) = ", list(d1))
print("list(d1.keys()) = ", list(d1.keys()))
print("list(d1.values() = ", list(d1.values()))
print("list(d1.items()) = ", list(d1.items()))

{% endJDoodle %}

### Exercise: word count

Write a program which:

* reads in a text from standard input
* prints out the frequency of each word in the text

> Use a dictionary to register each word and its frequency.
{: .block-tip }

Sample text:

```
Once upon a time, there was a beautiful girl named Cinderella. She lived with her wicked stepmother and two stepsisters. They treated Cinderella very badly.
One day, they were invited for a grand ball in the king's palace. But Cinderella's stepmother would not let her go. Cinderella was made to sew new party gowns for her stepmother and stepsisters, and curl their hair. They then went to the ball, leaving Cinderella alone at home.
Cinderella felt very sad and began to cry. Suddenly, a fairy godmother appeared and said, "Don't cry, Cinderella! I will send you to the ball!". But Cinderella was sad. She said, "I don't have a gown to wear for the ball!". The fairy godmother waved her magic wand and changed Cinderella's old clothes into a beautiful new gown! The fairy godmother then touched Cinderella's feet with the magic wand. And lo! She had beautiful glass slippers! "How will I go to the grand ball?", asked Cinderella. The fairy godmother found six mice playing near a pumpkin, in the kitchen. She touched them with her magic wand and the mice became four shiny black horses and two coachmen and the pumpkin turned into a golden coach. Cinderella was overjoyed and set off for the ball in the coach drawn by the six black horses. Before leaving, the fairy godmother said, "Cinderella, this magic will only last until midnight! You must reach home by then!".
When Cinderella entered the palace, everybody was struck by her beauty. Nobody, not even Cinderella's stepmother or stepsisters, knew who she really was in her pretty clothes and shoes. The handsome prince also saw her and fell in love with Cinderella. He went to her and asked, "Do you want to dance?" And Cinderella said, "Yes!". The prince danced with her all night and nobody recognized the beautiful dancer. Cinderella was so happy dancing with the prince that she almost forgot what the fairy godmother had said. At the last moment, Cinderella remembered her fairy godmother's words and she rushed to go home. "Oh! I must go!", she cried and ran out of the palace. One of her glass slippers came off but Cinderella did not turn back for it. She reached home just as the clock struck twelve. Her coach turned back into a pumpkin, the horses into mice and her fine ball gown into rags. Her stepmother and stepsisters reached home shortly after that. They were talking about the beautiful lady who had been dancing with the prince.
The prince had fallen in love with Cinderella and wanted to find out who the beautiful girl was, but he did not even know her name. He found the glass slipper that had come off Cinderella's foot as she ran home. The prince said, "I will find her. The lady whose foot fits this slipper will be the one I marry!". The next day, the prince and his servants took the glass slipper and went to all the houses in the kingdom. They wanted to find the lady whose feet would fit in the slipper. All the women in the kingdom tried the slipper but it would not fit any of them. Cinderella's stepsisters also tried on the little glass slipper. They tried to squeeze their feet and push hard into the slipper, but the servant was afraid the slipper would break. Cinderella's stepmother would not let her try the slipper on, but the prince saw her and said, "Let her also try on the slipper!". The slipper fit her perfectly. The prince recognized her from the ball. He married Cinderella and together they lived happily ever after.
```

{% empty_jdoodle %}

{% Solution %}
{% JDoodle %}
text = input("Please enter a text: ")
text = text.split()
text = [word.strip('.,"!?;:').lower() for word in text]

frequency1 = {}
for word in text:
    if word in frequency1:
        frequency1[word] += 1
    else:
        frequency1[word] = 1
#print(frequency1)
for word in frequency1:
    print(word, ":",frequency1[word])

print("================================================")
unique_words = set(text)
frequency2 = {}
for w in unique_words:
    frequency2[w] = text.count(w)
for key in frequency2:
    print(key, ":", frequency2[key])
{% endJDoodle %}
{% endSolution %}
