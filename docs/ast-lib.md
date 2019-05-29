# HHAST: Low-Level AST Library

## Installation

```
hhvm composer require hhvm/hhast
```

## Introduction

[`Facebook\HHAST\from_file()`](../src/entrypoints.php) is the main entry point to the library; it will get you an instance of
[`Node`](../src/Node.php), most likely a [`Script`](../codegen/syntax/Script.php). The main classes are:

 - [`Node`](../src/Node.php): the base class of all AST nodes
 - [`Token`](../src/Token.php): the base class of all nodes that are also tokens; this is a subclass of `Node`
 - [`Trivia`](../src/Trivia.php): the base class of all nodes that do not affect runtime behavior, such as whitespace and comments; this is a subclass of `Node`
 - [`NodeList`](../src/Trivia.php): this node merely contains a vector-like list of child nodes; this is a subclass of `Node`
 - [`Missing`](../src/Missing.php): a singleton; this node is present when an optional node is not present. It is a subclass of `Node`, and instantiated via the function `Missing()`

For every type of node in the full fidelity AST, there is a generated class extending `Node`, `Token`, or `Trivia`; for example, class declarations are represented by the [`ClassishDeclaration`](../codegen/syntax/ClassishDeclaration.php) class. These define accessors for every field on the node.

Additionally, several interfaces are defined for convenience, which are not present in the FFP schema:

 - `IControlFlowStatement`: implemented by structures like `if` and looping constructs
 - `IFunctionishDeclaration`: implemented by both function and method declarations
 - `ILoopStatement`: sub-interface of `IControlFlowStatement`, specifically for looping constructs

These are primarily useful for `instanceof` checks, or as a value for `classname<Node>` when calling `get(Children|Descendants)OfType()`.

For the basic API, see below; for usage examples, see:
 - [the unit tests](../tests/)
 - [the linters](../src/Linters/)
 - [the migrations](../src/Migrations/)

## Read Methods

 - `->getCode()`: convert an AST node to string code
 - `->getChildren()`: return all direct children of the node
 - `->getChildrenWhere((function(Node):bool))`: return all direct children of the node where the function returns true
 - `->getChildrenOfType(classname<Node>)`: return all direct children of the specified type
 - `->traverse()`: return the node and all recursive descendants
 - `->traverseWithParents()`: return the node and all recursive descendants, and the stack of the parents
 - `->getDescendantsWhere((function(Node$node, vec<Node> $parents):bool))`: return all recursive children of the node where the function returns true
 - `->getDescendantsOfType(classname<Node>)`: return all recursive children of the specified type
 - `->getFirstToken()`: returns the first `Token` that is part of the current node
 - `->getLastToken()`: returns the first `Token` that is part of the current node

## Write Methods

The AST does not support in-place editing; instead, all mutation functions return a new node with the specified mutation applied.

 - `->rewrite((function(Node $node, vec<Node> $parents): Node))`: traverses the AST, and applies the specified mapping function to every node. To remove a node, you can specify `Missing()`
 - `->rewriteDescendants((function(Node $node, vec<Node> $parents): Node)): this`: traverses the AST, and applies the specified mapping function to every node except itself, so returns a node of the same type.
 - `->replace(Node $old, Node $new)`: return a copy of the node with descendant `$old` replaced with `$new`
 - `->removeWhere((function(Node, vec<Node>)))`: returns a copy of the node without any descendants that pass the predicate
 - `->remove(Node)`: returns a copy of the node without the specified descendant
 - `->insertAfter(Node $target, Node $new)`: returns a copy of the node with the specified `$new` node inserted after the `$target` node
 - `->insertBefore(Node $target, Node $new)`: returns a copy of the node with the specified `$new` node inserted before the `$target` node

## Tokens

Tokens define:

 - `->getLeading()` - get leading trivia
 - `->getLeadingWhitespace()` - specifically, get leading whitespace
 - `->getTrailing()` - get leading trivia
 - `->getTrailingWhitespace()` - get leading trivia

## Codegen

For every field on AST node, there are at least two accessors; assuming a field called `some_field`:

 - `->getSomeFieldUNTYPED()`: always returns an `Node`
 - `->getSomeField()`: returns `T` or `?T` where T is either `Node`, or a subclass of it


If `Missing` is considered a valid value, additional methods are defined:

 - `->hasSomeField()`: returns true or false
 - `->getSomeFieldx()`: returns `T` or throws an exception if missing

## Advice

 - install `jq` or another JSON prettifier, and examine files containing AST structures you're interested in with `hh_parse --full-fidelity-json $file | jq`
 - use an IDE with autocompletion; there are far too many AST node types for memorizing the APIs to be practical
 - if you are using the write API, write unit tests with various combinations of leading and trailing whitespace and comments
