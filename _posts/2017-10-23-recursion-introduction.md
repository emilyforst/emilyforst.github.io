---
layout: post
title:  'Recursion: Introduction'
date:   2017-10-23 10:24:08 +0100
categories: recursion compsci
---

Welcome to the wonderful world of recursion!  This is a series of blog posts on thinking recursively.  The code samples are in JavaScript.  To get the most out of them, you'll need to understand just the basics (functions, arrays, conditionals).  There are many great JavaScript primers online ([Eloquent JavaScript](http://eloquentjavascript.net/ "Eloquent JavaScript"){:target="_blank"} is a favorite).  We'll use a small subset of the language, so if you're coming from another language, it shouldn't take long to get up to speed.  Let's get started!



Requirements
-------------

**Tools:**

> - Installation of NPM and Node 6.0.0 or higher
> - Text editor of your choice
> - Shell to run your code, like Terminal on OSX
> - GitHub account to get the exercises


**Optional:**

> - Debugger of your choice (I like Chrome DevTools)
> - Paper and pencil.  You may enjoy drawing diagrams of some of the concepts we cover.


## Head & Tail


Thinking about arrays as having a `head` and a `tail` is useful for thinking recursively.  The idea is simple, but powerful.

`head` is the first element of the array.  
`tail` is the array without the first element. 

### Examples

If the array is `[1,2,3,4,5]`:  

`head` ===  `1`  

`tail` ===`[2,3,4,5]`

If the array is `[["this", "is", "the", "head"], "and", "this", "is", "the", "tail"]`: 

`head` ===  `["this", "is", "the", "head"]`  

`tail` ===  `["and", "this", "is", "the", "tail"]`.

Head is always the first element of the array, even if the array is nested. Tail is always the array without the first element, equally regardless of nesting.

### Questions

What is the `head` of `[[["a"]], "b", "c"]`?  

What is the `tail` of `[4, [1, 0, 2, 5]]`?

Write a function `head` that returns the head of an array.  

Write a function `tail` that returns its tail.

<br/>

#### [Next post &#9658;]({% post_url 2017-10-24-recursion-part-1 %})





