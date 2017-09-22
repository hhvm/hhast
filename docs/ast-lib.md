# HHAST: Low-Level AST Library

## Installation

```
hhvm composer require hhvm/hhast
```

## Introduction

[`Facebook\HHAST\from_file()`](../src/entrypoints.php) is the main entry point to the library; it will get you an instance of
[`EditableNode`](../src/EditableNode.php), most likely a [`Script`](../codegen/syntax/Script.php). The main classes are:

 - [`EditableNode`](../src/EditableNode.php): the base class of all AST nodes
 - [`EditableToken`](../src/EditableToken.php): the base class of all nodes that are also tokens; this is a subclass of `EditableNode`
 - [`EditableTrivia`](../src/EditableTrivia.php): the base class of all nodes that do not affect runtime behavior, such as whitespace and comments; this is a subclass of `EditableNode`
 - [`EditableList`](../src/EditableTrivia.php): this node merely contains a vector-like list of child nodes; this is a subclass of `EditableNode`
 - [`Missing`](../src/Missing.php): a singleton; this node is present when an optional node is not present. It is a subclass of `EditableNode`, and instantiated via the function `Missing()`

For every type of node in the full fidelity AST, there is a generated class extending `EditableNode`, `EditableToken`, or `EditableTrivia`; for example, class declarations are represented by the [`ClassishDeclaration`](../codegen/syntax/ClassishDeclaration.php) class. These define accessors for every field on the node.

For the basic API, see below; for usage examples, see:
 - [the unit tests](../tests/)
 - [the linters](../src/Linters/)
 - [the migrations](../src/Migrations/)

## Read Methods

 - `->getCode()`: convert an AST node to string code
 - `->getChildren()`: return all direct children of the node
 - `->getChildrenWhere((function(EditableNode):bool))`: return all direct children of the node where the function returns true
 - `->getChildrenOfType(classname<EditableNode>)`: return all direct children of the specified type
 - `->traverse()`: return the node and all recursive descendants
 - `->traverseWithParents()`: return the node and all recursive descendants, and the stack of the parents
 - `->getDescendantsWhere((function(EditableNode$node, vec<EditableNode> $parents):bool))`: return all recursive children of the node where the function returns true
 - `->getDescendantsOfType(classname<EditableNode>)`: return all recursive children of the specified type
 - `->getFirstToken()`: returns the first `EditableToken` that is part of the current node
 - `->getLastToken()`: returns the first `EditableToken` that is part of the current node

## Write Methods

The AST does not support in-place editing; instead, all mutation functions return a new node with the specified mutation applied.

 - `->rewrite((function(EditableNode $node, vec<EditableNode> $parents): EditableNode))`: traverses the AST, and applies the specified mapping function to every node. To remove a node, you can specify `Missing()`
 - `->rewriteDescendants((function(EditableNode $node, vec<EditableNode> $parents): EditableNode)): this`: traverses the AST, and applies the specified mapping function to every node except itself, so returns a node of the same type.
 - `->replace(EditableNode $old, EditableNode $new)`: return a copy of the node with descendant `$old` replaced with `$new`
 - `->removeWhere((function(EditableNode, vec<EditableNode>)))`: returns a copy of the node without any descendants that pass the predicate
 - `->remove(EditableNode)`: returns a copy of the node without the specified descendant
 - `->insertAfter(EditableNode $target, EditableNode $new)`: returns a copy of the node with the specified `$new` node inserted after the `$target` node
 - `->insertBefore(EditableNode $target, EditableNode $new)`: returns a copy of the node with the specified `$new` node inserted before the `$target` node

## Tokens

Tokens define:

 - `->getLeading()` - get leading trivia
 - `->getLeadingWhitespace()` - specifically, get leading whitespace
 - `->getTrailing()` - get leading trivia
 - `->getTrailingWhitespace()` - get leading trivia

## Codegen

For every field on AST node, there are at least two accessors; assuming a field called `some_field`:

 - `->getSomeFieldUNTYPED()`: always returns an `EditableNode`
 - `->getSomeField()`: returns `T` or `?T` where T is either `EditableNode`, or a subclass of it


If `Missing` is considered a valid value, additional methods are defined:

 - `->hasSomeField()`: returns true or false
 - `->getSomeFieldx()`: returns `T` or throws an exception if missing

## Advice

 - install `jq` or another JSON prettifier, and examine files containing AST structures you're interested in with `hh_parse --full-fidelity-json $file | jq`
 - use an IDE with autocompletion; there are far too many AST node types for memorizing the APIs to be a workable strategy
 - if you are using the write API, write unit tests with various combinations of leading and trailing whitespace and comments
