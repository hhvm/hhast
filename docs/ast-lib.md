# HHAST: Low-Level AST Library

## Installation

```
php composer.phar require hhvm/hhast
```

`php` must be used, not `hhvm`.

## Introduction

[`Facebook\HHAST\from_file()`](../src/entrypoints.hack) is the main entry point to the library; it will get you an instance of
[`Node`](../src/nodes/Node.hack), most likely a [`Script`](../codegen/syntax/Script.hack). The main classes are:

 - [`Node`](../src/nodes/Node.hack): the base class of all AST nodes
 - [`Token`](../src/nodes/Token.hack): the base class of all nodes that are also tokens; this is a subclass of `Node`
 - [`Trivia`](../src/nodes/Trivia.hack): the base class of all nodes that do not affect runtime behavior, such as whitespace and comments; this is a subclass of `Node`
 - [`NodeList`](../src/nodes/NodeList.hack): this node merely contains a vector-like list of child nodes; this is a subclass of `Node`
 - [`ListItem`](../src/nodes/ListItem.hack): most `NodeList`s have these as
   children, each contains the relevant child node (accessed via `->getItem()`)
   and the separator that follows it (comma/backslash/...); `ListItem`s are not
   used by `NodeList`s without separators

For every type of node in the full fidelity AST, there is a generated class extending `Node`, `Token`, or `Trivia`; for example, class declarations are represented by the [`ClassishDeclaration`](../codegen/syntax/ClassishDeclaration.hack) class. These define accessors for every field on the node.

Additionally, several interfaces are defined for convenience, which are not present in the FFP schema; for example:

 - `IControlFlowStatement`: implemented by structures like `if` and looping constructs
 - `IFunctionishDeclaration`: implemented by both function and method declarations
 - `ILoopStatement`: sub-interface of `IControlFlowStatement`, specifically for looping constructs
 - see [`CodegenBase`](../src/__Private/codegen/CodegenBase.hack#L118) for the
   full list

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
 - `->getDescendantsWhere((function(Node$node, vec<Node> $parents):bool))`: return all recursive children of the node where the function returns true
 - `->getDescendantsOfType(classname<Node>)`: return all recursive children of the specified type
 - `->getAncestorsOfDescendant(Node $descendant)`: return the sequence of child
   nodes starting with `$this` and ending with `$descendant` (throws if not a
   descendant of `$this`); call on `Script` to get all ancestors
 - `->getParentOfDescendant(Node)`: return only the last node from the above list
 - `->getFirstToken()`: returns the first `Token` that is part of the current node
 - `->getLastToken()`: returns the first `Token` that is part of the current node
 - `->getChildrenOfItems(): vec<T>`: only available on `NodeList<ListItem<T>>`,
   returns the output of `getItem()` on each of the child `ListItem`s (for when
   you don't care about the separators)&mdash;so actually "items of children",
   despite the name

## Write Methods

The AST does not support in-place editing; instead, all mutation functions return a new node with the specified mutation applied.

 - `->with...($replacement)` returns a copy of the node with a specific child
   replaced, e.g. `$class->withName(new NameToken(...))` returns an identical
   class node except for its name; this is the only type-safe way to mutate an
   AST, as each of these methods is generated with the correct argument type
 - `->rewrite((function(Node $node, vec<Node> $parents): Node))`: traverses the AST, and applies the specified mapping function to every node;
   cannot add or remove nodes (see below)
 - `->rewriteDescendants((function(Node $node, vec<Node> $parents): Node)): this`: traverses the AST, and applies the specified mapping function to every node except itself, so returns a node of the same type.
 - `->replace(Node $old, Node $new)`: return a copy of the node with descendant `$old` replaced with `$new`

### Adding and removing nodes

Arbitrary nodes can't be added or removed, as it could result in an invalid AST.
Most commonly, nodes are added to or removed from a `NodeList`, which can be
done by providing a new `NodeList` to `->replace(...)` or to the parent node's
constructor or `->with...(...)` method. The `NodeList` class provides some
helper static methods:

- `NodeList::createMaybeEmptyList(vec<T>): NodeList<T>`
- `NodeList::createNonEmptyListOrNull(vec<T>): ?NodeList<T>`
- `NodeList::concat(NodeList<T>, NodeList<T>): NodeList<T>`

Other than that, nodes can only be added or removed when the parent node
declares a specific child as nullable, by passing `null` to the parent node's
constructor or `->with...(null)` method. For example,
`$class->withTypeParameters(null)` returns a copy of `$class` but without any
generic type parameters.

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


If `null` is considered a valid value, additional methods are defined:

 - `->hasSomeField()`: returns true or false
 - `->getSomeFieldx()`: returns `T` or throws an exception if missing

## Advice

 - HHAST can generate HTML pages to explore the AST when given a file from disk; you can create such an HTML file by using `bin/hhast-inspect --output="where_do_you_want_it.html" /path/to/hackfile.hack`
 - alternatively, install `jq` or another JSON prettifier, and examine files containing AST structures you're interested in with `hh_parse --full-fidelity-json $file | jq`
 - use an IDE with autocompletion; there are far too many AST node types for memorizing the APIs to be practical
 - if you are using the write API, write unit tests with various combinations of leading and trailing whitespace and comments
