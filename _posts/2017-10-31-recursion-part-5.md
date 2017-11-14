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

	         11
	        /  \
	       7    15
	      / \   / \
	     2  8  13  18

In this tree, the root node is 11. It's left child, 7, is smaller, and its right child, 15, is larger.  

            11
           /  \
          7    15

Let's look at 11's children.  If we investigate 7, it follows the same patter, it's left child, 2, is smaller, and it's right child, 8, is larger. 

             7
            / \
           2   8

 This leaves us with 15.  Its left child, 13 is smaller, and its right child, 18, is larger.

             15
            /  \
           13   18

This is a specialized form of a binary tree called a Binary Search Tree.  All the nodes to its left are smaller than the root node.  All the nodes to its right are larger.  If we were looking for a specific value, we'd only search a portion of the tree, making our search time much shorter.

Next, let's build a binary tree class.

{% highlight js %}
class BinaryTree() {
  constructor() {
    this.root = null;
  }
}
{% endhighlight %}

{% highlight js %}
class Node {
  constructor(value) {
    this.value = value;
    this.left = null;
    this.right = null;
  }
}
{% endhighlight %}

### Binary Tree Node Insertion

{% highlight js %}
class BinarySearchTree {
  constructor() {
    this.root = null;
  }

  insert(value) {
   if(!this.root){
      this.root = new Node(value);
      return;
   }   
  }
}

class Node {
  constructor(value) {
    this.value = value;
    this.left = null;
    this.right = null;
  }
}
{% endhighlight %}

{% highlight js %}
class BinarySearchTree {
  constructor() {
    this.root = null;
  }

  insert(value) {
   if(!this.root){
      this.root = new Node(value);
      return;
   } 

   if (this.root.value === value) {
     console.log("This node is already in the tree and won't be inserted."); 
   } 
  }
}

class Node {
  constructor(value) {
    this.value = value;
    this.left = null;
    this.right = null;
  }
}
{% endhighlight %}

### Binary Tree Node Deletion 
