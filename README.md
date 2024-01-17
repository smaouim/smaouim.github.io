# Quick writing guide!

for the theme explanation (how to add a draft, chapter, post, page, headers & footers, .. etc), please check the official website: [Jekyll Chapterbook Theme](https://jasongrimes.github.io/jekyll-chapterbook/)

## Customized elements
### JDoodle

to add an empty JDoodle block

```
{% empty_jdoodle %}
```

to add a code in JDoodle

```
{% JDoodle %}
# I'm a comment
print("my code goes here")
{% endJDoodle %}
```

### Solution

to add a soltion block

```
{% Solution %}

I am a text solution
{% endSolution %}
```

code solution

```
{% Solution %}
{% JDoodle %}
print("Solution goes here")
{% endJDoodle %}
{% endSolution %}
```

two solutions

```
{% Solution %}
{% JDoodle %}

{% endJDoodle %}

Another solution
{% JDoodle %}

{% endJDoodle %}
{% endSolution %}
```

### tip

to add a one line tip

```
> I'm a one line tip
{: .tip }
```

multiple line

```
> I'm the first paragraph
> 
> and I'm the second
{: .tip }
```