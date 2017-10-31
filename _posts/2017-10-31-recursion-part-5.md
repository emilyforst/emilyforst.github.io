---
layout: post
title: 'Recursion, Part 5: Building Binary Trees'
date:  2017-10-31 17:35:02 +0000 
categories: recursion compsci
---


Let's revisit one of our trees from the last post.


	         11
	        /  \
	       7    15
	      / \   / \
	     2  8  13  18


{% highlight js %}
const binaryTreeB = {
  value: 11, 
  left: {
    value: 7, 
    left: {
      value: 2, 
      left: null, 
      right: null
    }, 
    right: {
      value: 8, 
      left: null, 
      right: null
    }
  }, 
  right: {
    value: 15,
    left: {
      value: 13, 
      left: null, 
      right: null
    }, 
    right: {
      value: 18, 
      left: null, 
      right: null
    }
  }
};
{% endhighlight %}

Did you notice anything special about it?