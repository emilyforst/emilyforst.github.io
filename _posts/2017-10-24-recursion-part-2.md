---
layout: post
title: 'Recursion, Part 2: Building Arrays'
date:   2017-10-24 11:45:44 +0100 
categories: recursion compsci
---

You'll find the companion GitHub repository for Part 2 here.  The following post is meant to serve as a foundation for working through the practice problems. You may also want to have a console open to experiment with while reading.  Have fun!

## Building Arrays

Let's say we want to write a function, `onlyIntegers`, that takes in an array and returns a new array with all non-integers removed.  As before, we'll use our small subset of JavaScript.  Also as before, we know almost everything we need to in order to find a solution.  The rest we'll fill in step by step.

### Breaking Down The Logic 

Let's break down the logic of `onlyIntegers`, so we understand how it differs from `allIntegers`

1. Visit each item in an array
2. Check if it's an integer
3. Return a result (a new array)

Again, we already know how to do a lot!

1. ~~Visit each item in an array~~
2. ~~Check if it's an integer~~
3. Return a result (a new array)

### Traversing the Array

In the last section, we learned how to traverse arrays.  We can write a good amount of our `onlyIntegers` function knowing only that.  First, we'll define our function and pass it the array `[1,2,"not me", 3, "or me", 4, true, 4.9, 5]` as an argument.

{% highlight js %}
function onlyIntegers() {

}
onlyIntegers([1,2,"not me", 3, "or me", 4, true, 4.9, 5])
{% endhighlight %}

We'll use `head` and `tail` as before.

{% highlight js %}
function onlyIntegers([head, ...tail]) {

}
onlyIntegers([1,2,"not me", 3, "or me", 4, true, 4.9, 5])
{% endhighlight %}

We also know that we can traverse the array by recurring with `tail`.

{% highlight js %}
function onlyIntegers([head, ...tail]) {
  onlyIntegers(tail);
}
onlyIntegers([1,2,"not me", 3, "or me", 4, true, 4.9, 5])
{% endhighlight %}

We know we have to find a terminating condition, which again, is that we've checked every item in the array and now it's empty.

{% highlight js %}
function onlyIntegers([head, ...tail]) {
  if (!head && !tail.length) return;
  onlyIntegers(tail);
}
onlyIntegers([1,2,"not me", 3, "or me", 4, true, 4.9, 5])
{% endhighlight %}

If we run the function as it stands, we successfully visit each element of the array, and then return.  But what *value* should we return?

### Returning an Empty Array

Our problem asks us to return a new array.  There are many good reasons why we may be asked this.  One is that we don't mutate the original array.  Another is that it may make our code more composable.  However, we're not too concerned with such lofty things at the moment.  Let's be lazy and start by just returning an empty array.  

{% highlight js %}
function onlyIntegers([head, ...tail]) {
  if (!head && !tail.length) return [];
  return onlyIntegers(tail);
}
onlyIntegers([1,2,"not me", 3, "or me", 4, true, 4.9, 5])
{% endhighlight %}

If we run `onlyIntegers` now, we get exactly what we expect,  an empty array.  As it stands now, we have a function that will traverse an array and return an empty array every time.  Well, we are returning an array, so we're part way there.  However, we want it to include only the integer values of the original array.  

### Functions that Call Functions

Let's hop into our console and experiment.

You've likely already seen functions that call functions.

{% highlight js %}
function addBerry(word) {
  return word.concat("berry");
}

function addGiant(word) {
  return ("giant ").concat(word);	
}

function giantBerry(word) {
  return addGiant(addBerry(word));	
}

console.log(giantBerry("straw"));
console.log(giantBerry("blue"));
console.log(giantBerry("chuck "));
{% endhighlight %}

Here, when we call `giantBerry` it in turn makes two function calls.  One to `addBerry` and another to `addGiant`.  The function `addGiant` waits for `addBerry` to return, and then does some work with the returned value.

We could continue adding function calls to build our result.  

{% highlight js %}
function addBerry(word) {
  return word.concat("berry");
}

function addGiant(word) {
  return ("giant ").concat(word);	
}

function veryExcited(word) {
	return (word).concat("!!!");
}

function veryExcitedGiantBerry(word) {
  return veryExcited(addGiant(addBerry(word)));	
}

console.log(veryExcitedGiantBerry("straw"));
console.log(veryExcitedGiantBerry("blue"));
console.log(veryExcitedGiantBerry("chuck "));
{% endhighlight %}

### Using concat()

We want to be able to add values to the array we're currently returning empty.  For that, we're going to use `concat()`.  

Let's imagine that our function has checked every value in the array and has now been told to return `[]`.  The last value it checked was `5`, so let's concat `[5]` with an empty array.

`[5].concat([])` returns `[ 5 ]`

Let's imagine that `[ 5 ]` was returned to the function that called it.  How do we add that function's `head` value to our array? It's `head` was `4.9`.  Let's concat that value as well.

`[ 4.9 ].concat([5])` returns `[ 4.9, 5 ]`

Next, what was the value of head in the previous function call?  `true` Have we returned from every function call we've made yet? No.  We've only returned from our very last two function calls.  Let's concat this function call's `head` value when we return as well.

`[true].concat([ 4.9, 5 ])` returns `[ true, 4.9, 5 ]`

In this way, we build a new array, value by value, as we return from every preceding function call.  Only when the very first function call returns do we return from `onlyIntegers` entirely, and with a new array in hand.  Let's try that.


{% highlight js %}
function onlyIntegers([head, ...tail]) {
  if (!head && !tail.length) return [];
  return [head].concat(onlyIntegers(tail));
}
onlyIntegers([1,2,"not me", 3, "or me", 4, true, 4.9, 5])
{% endhighlight %}

Great! Now we return an array with values in it.  We've achieved our goal of successfully adding values to our new array.  The only thing is, we add every single value of the original array to our new array.  We still have some work to do.

### Using Head

Let's use `head` as we did before do to some work in the function.  What do we want to do?  Let's only add `head` to the new array if it's an integer.

{% highlight js %}
function onlyIntegers([head, ...tail]) {
  if (!head && !tail.length) return [];
  if (Number.isInteger(head)) {
    return [head].concat(onlyIntegers(tail));
  } else {
    return onlyIntegers(tail);
  }
}
onlyIntegers([1,2,"not me", 3, "or me", 4, true, 4.9, 5])
{% endhighlight %}

Now we're done!  Let's follow our logic.

1. If the array is empty, simply return an empty array
2. If the value is an integer, add `head` to the new array `[head].concat` and keep checking the rest of the array `onlyIntegers(tail)`
3. If the value is not an integer, just keep checking the rest of the array `onlyIntegers(tail)`

We generally use head when we want to do some work, like checking if a value is an integer.
We generally recur when we want to keep checking the rest of the array.  


