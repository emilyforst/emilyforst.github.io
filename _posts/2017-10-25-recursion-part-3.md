---
layout: post
title:  'Recursion, Part 3: Working with Nested Arrays'
date:   2017-10-24 019:32:34 +0100
categories: recursion compsci
---

The basic function

{% highlight js %}
function deepOnlyIntegers([head, ...tail]) {

}
onlyIntegers([1,[[2],"not me"], 3, [["or me", 4]], [true, [[4.9]], 5]])
{% endhighlight %}

### Traversing the Array

Let's begin by traversing the array

{% highlight js %}
function deepOnlyIntegers([head, ...tail]) {
  if (!head && !tail.length) return;
  deepOnlyIntegers(tail);
}
deepOnlyIntegers([1,[[2],"not me"], 3, [["or me", 4]], [true, [[4.9]], 5]]);
{% endhighlight %}

Then, we know we're returning a new array so let's add that.

{% highlight js %}
function deepOnlyIntegers([head, ...tail]) {
  if (!head && !tail.length) return [];
  return deepOnlyIntegers(tail);
}
deepOnlyIntegers([1,[[2],"not me"], 3, [["or me", 4]], [true, [[4.9]], 5]]);
{% endhighlight %}

### Checking for Arrays with Head

Then our code forks into two possibilities.  Either the value we're checking is an array, or it isn't.  Let's add that check.

{% highlight js %}
function deepOnlyIntegers([head, ...tail]) {
  if (!head && !tail.length) return [];
  if (Array.isArray(head)) {
    
  } 
  return deepOnlyIntegers(tail);  
}
deepOnlyIntegers([1,[[2],"not me"], 3, [["or me", 4]], [true, [[4.9]], 5]]);
{% endhighlight %}

Let's first investigate the case where head is not an array.  If head is not an array, our code forks into two possibilities.  If head is not an array, then it's a single value.  That value is either and integer that we want to include in our new array, or a non-integer that we want to leave out.  We remember how to add values to our list from the last post, so let's do that.

{% highlight js %}
function deepOnlyIntegers([head, ...tail]) {
  if (!head && !tail.length) return [];
  if (Array.isArray(head)) {
    
  } else {
    if (Number.isInteger(head)) {
      return [head].concat(deepOnlyIntegers(tail));
    } else {
      return deepOnlyIntegers(tail);
    }
  }  
}
deepOnlyIntegers([1,[[2],"not me"], 3, [["or me", 4]], [true, [[4.9]], 5]]);
{% endhighlight %}

What happens in our function so far?  It finds `1`, which is an integer, so it concats that value with the head of the tail, the value `[[2],"not me"]`.  Now we have an array case, which we haven't accounted for, and it returns `undefined`.  We haven't told our function to keep checking the array so it simply returns.  It concats `undefined` with `1` and returns `[1, undefined]`.

Not exactly what we wanted.  Let's account for the array case.

What would happen if we used our normal way of building lists?

{% highlight js %}
function deepOnlyIntegers([head, ...tail]) {
  if (!head && !tail.length) return [];
  if (Array.isArray(head)) {
    return [head].concat(deepOnlyIntegers(tail));
  } else {
    if (Number.isInteger(head)) {
      return [head].concat(deepOnlyIntegers(tail));
    } else {
      return deepOnlyIntegers(tail);
    }
  }  
}
deepOnlyIntegers([1,[[2],"not me"], 3, [["or me", 4]], [true, [[4.9]], 5]]);
{% endhighlight %}

Well, now we get the entire original array.  Getting closer, but not there yet.

### Recurring with Head

{% highlight js %}
function deepOnlyIntegers([head, ...tail]) {
  if (!head && !tail.length) return [];
  if (Array.isArray(head)) {
    return [deepOnlyIntegers(head)].concat(deepOnlyIntegers(tail));
  } else {
    if (Number.isInteger(head)) {
      return [head].concat(deepOnlyIntegers(tail));
    } else {
      return deepOnlyIntegers(tail);
    }
  }  
}
deepOnlyIntegers([1,[[2],"not me"], 3, [["or me", 4]], [true, [[4.9]], 5]]);
{% endhighlight %}

And we're finished!







