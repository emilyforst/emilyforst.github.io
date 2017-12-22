---
layout: post
title: 'Recursion, Part 6: Traversing Binary Trees'
date:  2017-11-01 10:31:54 +0000 
categories: recursion compsci
---
##Common Tree Traversals for Binary Trees

> - Breadth First (also called Level Order)
> - Depth First
  > (a) Inorder 
  > (b) Preorder 
  > (c) Postorder


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



Let's write a function that traverses this tree, and logs each node to the console.  As usual, let's start by writing the function.

{% highlight js %}
function logBinaryTree(tree) {
	
}
logBinaryTree(binaryTreeB)
{% endhighlight %}


And we're finished!

{% highlight js %}
function logBinaryTree(tree) {
  console.log(tree.value);
  if (!tree.left && !tree.right) return;
  if (tree.left && tree.right) {
    return logBinaryTree(tree.left) || logBinaryTree(tree.right)
  }
}
logBinaryTree(binaryTreeB)
{% endhighlight %}


Let's write a function that logs a node to the console only if it's an integer.

{% highlight js %}
const binaryTreeC = {
  value: 11, 
  left: {
    value: "a", 
    left: {
      value: "c", 
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
    value: false,
    left: {
      value: 13, 
      left: null, 
      right: null
    }, 
    right: {
      value: "b", 
      left: null, 
      right: null
    }
  }
};
{% endhighlight %}

Write a function `onlyIntegersTree` that only logs the integer values of a binary tree.

{% highlight js %}
function onlyIntegersTree(tree) {

}
onlyIntegersTree(binaryTreeC);
{% endhighlight %}

And we're finished!

{% highlight js %}
function onlyIntegersTree(tree) {
  if (Number.isInteger(tree.value)) console.log(tree.value);
  if (!tree.left && !tree.right) return;
  if (tree.left && tree.right) {
    return onlyIntegersTree(tree.left) || onlyIntegersTree(tree.right)
  }
}
onlyIntegersTree(binaryTreeC);
{% endhighlight %}