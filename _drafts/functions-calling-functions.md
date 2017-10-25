---
layout: post
title: 'Recursion: Part 1'
---

### Functions that Call Functions

Let's hop into our console and experiment.

You've likely already seen functions that call functions.

#### Building a String

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

#### Building a Bigger String 

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

#### Returning a Boolean

What will this function return?

{% highlight js %}
function a() {
  return true;
}

function b() {
  return a();    
}

function c() {
  return b();      
}

function d() {
  return c();    
}

function e() {
  return d(); 
}

e();
{% endhighlight %}

How about this one?

{% highlight js %}
function a() {
  return true;
}

function b() {
  return a();    
}

function c() {
  return false;      
}

function d() {
  return c();    
}

function e() {
  return d(); 
}

e();
{% endhighlight %}


#### Returning a Number

The same can be done with mutliple calls to the same function.

What does this return?

{% highlight js %}
function addOne(number) {
  return number + 1;
}

addOne(addOne(addOne(addOne(addOne(0)))));
{% endhighlight %}


