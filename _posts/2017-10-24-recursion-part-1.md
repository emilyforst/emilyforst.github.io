---
layout: post
title: 'Recursion, Part 1: Traversing Arrays'
date:   2017-10-23 15:44:07 +0100
categories: recursion compsci
---

Now that we're set up, let's dive in!  For this section, clone this GitHub respository.  Try to answer all of the questions in the questions folder yourself.  However, if you get stuck, there's a solutions folder with suggested solutions.  There are many ways to answer these questions, and your answer may not match the one in the solutions folder.  However, consider reviewing the blog post and using a debugger before jumping to the solution.  And most importantly, enjoy!  

## Traversing Arrays

Let's say we're asked to write a function to find out if an array contains only integers.  If all its elements are integers, then we return `true`, otherwise, `false`.  However, we have a single constraint.  We must not use a) any loops or b) any array methods like `forEach()`.  Where do we start?

### Breaking Down The Logic  

When we break down the logic of the problem, we realize that we already know how to do most of what we need to.

1. Visit each item in an array.
2. Check if it's an integer (we can use `Number.isInteger()`)
3. Return a result (`return true` or `return false`)

Since we already know how to check if a number is an integer, and how to return a value, all we're left with is visiting each item in the array. 

1. Visit each item in an array.
2. ~~Check if it's an integer or not (we can use `Number.isInteger()`)~~
3. ~~Return a result (simply, `return`)~~

How do we do that?  

### Using Head and Tail

Well, let's start by writing the function and passing it the array `[1,2,3,4,5]`. 

{% highlight js %}
function allIntegers() {
  
}
allIntegers([1,2,3,4,5])
{% endhighlight %}

What do we want to name the array passed to our function? In our case, it would actually be better to have access to `head` and `tail` variables rather than a single parameter named something like `array` (you'll see why in a moment).  We'll create these variables with the [rest operator](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/rest_parameters/ "Rest parameters"){:target="_blank"}.  Let's check that this works. 


{% highlight js %}
function allIntegers([head, ...tail]) {
  console.log(head);
  console.log(tail);
}
allIntegers([1,2,3,4,5])
{% endhighlight %}

We should have `1` and `[2,3,4,5]` logged to the console.  Great! We can now access the first element of the array with `head` and the array without the first element with `tail`.

### Recurring With Tail

Now that we have a `tail` variable, we can use it to traverse the array. How?  By calling `allIntegers` within our function and passing it different arguments each time.  Specificaly, we pass `tail` each time. We could also say that we "recur with tail". When we recur with `tail`, we get new bindings for `head` and `tail` with each function call.  That may sound confusing, so let's experiment with `allIntegers`.

{% highlight js %}
function allIntegers([head, ...tail]) {
  allIntegers(tail);
}
allIntegers([1,2,3,4,5])
{% endhighlight %}

If we look at what `head` and `tail` are bound to with each function call , we should get this:

Call     | Head | Tail
-------- | ----   ----
1 | `1` | `[2,3,4,5]`
2 | `2` | `[3,4,5]`
3 | `3` | `[4,5]`
4 | `4` | `[5]`
5 | `5` | `[]` 

<br/>
The first time we call `allIntegers`, `tail` gives us `[2,3,4,5]`.  However, the next time we call `allIntegers`, `tail` gives us `[3,4,5]`.  What's interesting to remember here is that the length of the array we're checking gets shorter by one element each time.  Eventually, we run out of elements to check and are left with an empty array.

How does this work?  All our function does so far is pass the `tail` of the previous `tail` each time. If you pass `[1,2,3,4,5]` to the `tail` function you wrote in the introduction, `[2,3,4,5]` should be returned to you.  Use your `tail` function now on `[2,3,4,5]` and it returns`[3,4,5]`.  That's exactly what we're doing in `allIntegers`, passing the `tail` of the previous `tail` over and over again.

That's all fine, but have we found out if an array contains only integers?  Well, let's check.

{% highlight js %}
function allIntegers([head, ...tail]) {
  allIntegers(tail);
}
allIntegers([1,2,3,4,5])
{% endhighlight %}

Hmm... something doesn't seem to be working.  We're not quite there yet.

### Finding A Terminating Condition

Currently, `allIntegers` never returns a value.  It's elegant, in that we're doing a good amount of work with a few lines of code... but you know what they say, "form follows function".  Let's step through `allIntegers` a few more times to see what's going on.

Call     | Head | Tail
-------- | ----   ----
1 | `1` | `[2,3,4,5]`
2 | `2` | `[3,4,5]`
3 | `3` | `[4,5]`
4 | `4` | `[5]`
5 | `5` | `[]`
6 | `undefined` | `[]`
7 | `undefined` | `[]`
8 | `undefined` | `[]`
9 | `undefined` | `[]`
10 | `undefined` | `[]`
11 | `undefined` | `[]`
12 | `undefined` | `[]`


<br/>
It looks like our function keeps calling itself... forever.  Well, that's not what we wanted.

#### Breaking Down The Logic, Part 2
Well, we got this far by writing a single function call in `allIntegers`.  This can't be too hard.  Let's think.  When do we want our function to stop?
1. It's found a non-integer.  In this case, `return false;`
2. It's checked every element and they're all integers. In this case, `return true;`

Are there any other cases we haven't considered? No. Either our function returns `true` or `false`.  As it stands now, after `allIntegers` checks each value in the array, it seems to continue running passing `head` === `undefined` and `tail` === `[]` as arguments. When is  `head` === `undefined` and `tail` === `[]`? When we've already checked every value in the array.  In other words, when `[1,2,3,4,5]` is now empty.  If we haven't found a non-integer yet, then all the values in the array are integers.  That must be when we stop!

{% highlight js %}
function allIntegers([head, ...tail]) {
  if (!head && !tail.length) return true;
  return allIntegers(tail);
}
allIntegers([1,2,3,4,5])
{% endhighlight %}



### Using Head
 
Let's run `allIntegers` now, passing in `[1,2,3,4,5]`.  And it returns... `true`.  It does exactly what we wanted! It checks every element of the array, and when it runs out of elements to check, it returns `true`. 

Let's call `allIntegers` with a false case just to make sure. And `allIntegers([1,2,3,"nope", 5])` ... also returns `true`.  How did that happen?  Currently, we don't check to see if each value is an integer.  We just traverse the array, and when we run out of elements, we return `true`.  We're almost there.  Each value of the array can be accessed with `head`, so let's use `head` to check for non-integers.

{% highlight js %}
function allIntegers([head, ...tail]) {
  if (!head && !tail.length) return true;
  if (!Number.isInteger(head)) {
    return false;
  } else {
    return allIntegers(tail);
  }
}
allIntegers([1,2,3,"nope", 5])
{% endhighlight %}

Have we checked everything?  Yes.  In our code now, we've accounted for all cases.

1.  There are no non-integers: `if (!head && !tail.length) return true;`
2.  There is a non-integer `if (!Number.isInteger(head)) return false;`
3.  Maybe there's a non-integer in the rest of the array.  Let's keep checking `return allIntegers(tail);`


<br/>

#### [Next post &#9658;]({% post_url 2017-10-24-recursion-part-2 %})

