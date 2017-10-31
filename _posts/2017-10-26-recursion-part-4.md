---
layout: post
title: 'Recursion, Part 4: Traversing Binary Trees'
date:   2017-10-26 10:39:04 +0100 
categories: recursion compsci
---

> **Binary Tree Terminology**

> - Nodes - the values we store
> - Edges - the lines between nodes
> - Root node - topmost node in the tree
> - Parent - a node with 0, 1, or 2 children
> - Child - a node that represents the left or right descendent of a parent

## Introduction to Binary Trees

Up until this point, we've been working exclusively with arrays.  Now, we'll begin working with our first data structure, trees.

A tree is a data structure that stores data in a hierarchical way. It consists only of nodes, and edges.  Nodes represent the values we store.  Edges represent how these values are connected.  A tree diagram is generally read from top to bottom.

        2
       / \
      /   \
     1     3

In this tree, the nodes are 2, 1, and 3.  The edges are the lines connecting them.  In this tree, we have a parent with two children, a left child and a right child.

        2 (parent)
       / \
      /   \
     1     3 (left child, right child)


Binary trees are a subset of trees.  Binary trees are very simple.  They consist only of nodes, and edges, like all trees.  However, in a binary tree, we describe each node as a parent that has 0,1 or 2 children.  

In the above small tree, we'd say that 2 is the parent.  It has a left child, 1, and a right child, 3.  Here, 1 and 3 don't have any children.  When a node has either no left or no right child, we can represent the lack of a child with `null`.  The above tree could also be written like this, where `n` represents a null value.

          2 (parent)
         / \
        /   \
       1     3 (child, child)
      / \   / \
     n   n n   n

For our purposes, we'll imagine trees to be objects that store other objects. In this way, the above tree can be written as a series of nested objects.

{% highlight js %}
const binaryTreeA = 
  {value: 2, 
    left: {
      value: 1, 
      left: null, 
      right: null
    }, 
    right: {
      value: 3,
      left: null, 
      right: null
    }
  };
{% endhighlight %}

### Traversing a Binary Tree

Let's write a slightly larger tree:


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



Let's also write a function that traverses this tree, and logs each node to the console.  As usual, let's start by writing the function.

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




