---
layout: post
title: 'Recursion, Part 4: Introduction to Binary Trees'
date:   2017-10-26 10:39:04 +0100 
categories: recursion compsci
---

> **Binary Tree Terminology**

> - Nodes - the values we store
> - Edges - the lines between nodes
> - Root - topmost node in the tree
> - Parent - a node with 0, 1, or 2 children
> - Child - a node that represents the left or right descendent of a parent
> - Leaf - a node with no children

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

### Determining the Size of a Binary Tree

> **Binary Tree Size Terminology**

> - Height - The number of edges from a node to the tree's root node
> - Depth - The number of edges on the longest path from a node to a leaf node
> - Level - 1 + the number of edges from the node to the tree's root node







