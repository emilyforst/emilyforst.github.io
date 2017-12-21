---
layout: post
title: 'Recursion, Part 5: Building Binary Trees'
date:  2017-10-31 17:35:02 +0000 
categories: recursion compsci
order: 6
---

## Binary Search Trees

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

Next, let's build a binary search tree class.

{% highlight js %}
class BinarySearchTree {
  constructor(value) {
    this.value = value;
    this.left = null;
    this.right = null;
  }
}
{% endhighlight %}

### Binary Search Tree Node Insertion

Let's write a binary search tree class and give it an insert method.  Let's begin with a class that creates an instance with a value, a left child, and a right child.

{% highlight js %}
class BinarySearchTree {
  constructor(value) {
    this.value = value;
    this.left = null;
    this.right = null;
  }
}
{% endhighlight %}

Next, let's give our binary search tree class an insert method.

{% highlight js %}
class BinarySearchTree {
  constructor(value) {
    this.value = value;
    this.left = null;
    this.right = null;
  }
}
{% endhighlight %}

{% highlight js %}
BinarySearchTree.prototype.insert = function(value) {
 if (this.value === value) {
   console.log("This node is already in the tree and won't be inserted."); 
 }

 if (this.value > value) {
   if (!this.left) {
     this.left = new BinarySearchTree(value);
   } else {
     this.left.insert(value);
   } 
 } 

if (this.value < value) {
  if (!this.right) {
     this.right = new BinarySearchTree(value);
    } else {
      this.right.insert(value);
    }
  }
}
{% endhighlight %}

### Binary Search Tree Node Deletion 

Now that we have an insert method, let's also give our class a remove method.

{% highlight js %}
BinarySearchTree.prototype.remove = function(value) {
  if (this.value > value) {
    if(this.left.value === value) {
      if (this.left.left) {
        this.left = this.left.left;
      } else if (this.left.right){
        this.left = this.left.right;
      }
    } else {
      this.left.remove(value);
    }
  }

  if (this.value < value) {
    if(this.right.value === value) {
      if (this.right.right) {
        this.right = this.right.right;
      } else if (this.right.left){
        this.right = this.right.left;
      }
    } else {
      this.right.remove(value);
    }
  }
}
{% endhighlight %}