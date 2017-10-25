---
layout: post
title:  'Recursion, Part 3: Working with Nested Arrays'
date:   2017-10-24 019:32:34 +0100
categories: recursion compsci
---

Let's write a function `deepOnlyIntegers` that returns an array, removing all non-integers, no matter how deeply the array is nested.  

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

Then our logic forks into two possibilities.  
1. Either the value we're checking is an array
2. Or it isn't.  

Let's add that check.

{% highlight js %}
function deepOnlyIntegers([head, ...tail]) {
  if (!head && !tail.length) return [];
  if (Array.isArray(head)) {
    
  } else  {
    return deepOnlyIntegers(tail); 
  } 
}
deepOnlyIntegers([1,[[2],"not me"], 3, [["or me", 4]], [true, [[4.9]], 5]]);
{% endhighlight %}

Let's first investigate the case where `head` is not an array.  If `head` is not an array, then our logic forks into two additional possibilities.  
1. `head` is either an integer and we want to include in our new array
2. or a non-integer and we want to exclude it 

We know how to add values to our array from the last post, so let's build our array by concatenating `head` with `deepOnlyIntegers(tail)`

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

What happens in our function so far?  It finds `1`, which is an integer, so it concatenates `1` with the `head` of the `tail`, the value `[[2],"not me"]`.  Now we have an array case, which we haven't accounted for, and it returns `undefined`.  We haven't told our function to keep checking the array so it simply returns.  It concatenates `undefined` with `1` and returns `[1, undefined]`.

Not exactly what we wanted.  Let's account for the array case.

What would happen if we used our normal way of building arrays?

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

In the case that `head` is an array, we recur with `head`.

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







