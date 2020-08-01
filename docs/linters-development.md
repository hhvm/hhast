# HHAST: Developing Linters

## Linter Base Classes

 - [`BaseLinter`](../src/Linters/BaseLinter.hack): base class of all linters, and independent from the AST
 - [`AutoFixingLinter`](../src/Linters/AutoFixingLinter.hack): an interface that specifies that a linter is able to fix its own lint problems. Usually you shouldn't extend this directly, but use one of the base classes below, or [`AutoFixingLinterTrait`](../src/Linters/AutoFixingLinterTrait.hack) if there is no appropriate base class.
 - [`ASTLinter`](../src/Linters/ASTLinter.hack): base class for linters that use the AST to detect issues, but don't have an auto-fix. You'll need to extend this if you want to use the AST to detect an issue, but an approach other than AST manipulation to automatically fix them (e.g. shelling out to `hh_client --refactor`)
 - [`AutoFixingASTLinter`](../src/Linters/AutoFixingASTLinter.hack): a subclass of `ASTLinter` which implements `AutoFixingLinter`, for when your auto-fix is based on an AST mutation
 - [`LineLinter`](../src/Linters/LineLinter.hack), [`AutoFixingLineLinter`](../src/Linters/AutoFixingLineLinter.hack): for linters that operate on a single line at a time
 - [`FunctionNamingLinter`](../src/Linters/FunctionNamingLinter.hack): for linters that enforce function/method naming conventions

## Error Base Classes

 - [`LintError`](../src/Linters/LintError.hack): base of all linter errors. It allows you to provide a description and blame text (usually code)
 - [`ASTLintError`](../src/Linters/ASTLintError.hack): subclass of `LintError` for linters that derive from `ASTLinter` or `AutoFixingASTLinter`
 - [`LineLintError`](../src/Linters/LineLintError.hack): for `LineLinter` and `AutoFixingLineLinter`

## Getting Started

The best way is to read through [the existing linters](../src/Linters/) to get a feel for what's supported, and what works well.

It's best to heavily use unit tests when working on linters; once your tests pass and you're ready to get started, add it to your `hhast-lint.json`.

To run your own new linter, you can add the classname of your linter to `Facebook\HHAST\__Private\LintRunConfig::DEFAULT_LINTERS` which can be found at `src/__Private/LintRunConfig.hack:61` as of October 2019.

HHAST can generate HTML pages to explore the AST when given a file from disk. You can create such an HTML file by using `bin/hhast-inspect --output="where_do_you_want_it.html" /path/to/hackfile.hack` This works for all hack files, not just for `.hack` files. These files are a tremendous help for visualizing the AST.

## Testing

We are using *HackTest* -- see [its documentation](https://github.com/hhvm/hacktest/blob/master/README.md).

Instead of extending `TestCase` directly, you probably want to extend one of the more specific base classes (use the `LinterTestTrait` trait for linter tests). Again, see [existing tests](https://github.com/hhvm/hhast/tree/master/tests) for examples.

Most tests require Hack files as input and expected output. These go in the [`tests/examples`](https://github.com/hhvm/hhast/tree/master/tests/examples) directory. You should provide:

- `file.hack.in` -- test input
- `file.hack.expect` -- expected output (if you don't create one, the test framework will offer to do so when you run your test for the first time)
- `file.hack.autofix.expect` (for auto-fixing linters) -- expected code after applying autofixes
- `file.hack.hhconfig` (optional) -- custom `.hhconfig` file, if your test depends on specific options

## Advice

 - install `jq` or another JSON prettifier, and examine files containing AST structures you're interested in with `hh_parse --full-fidelity-json $file | jq`
 - use an IDE with autocompletion; there are far too many AST node types for memorizing the APIs to be practical
 - include various combinations of leading and trailing whitespace and comments in your unit tests for auto-fixing linters
 - if you use `hackfmt` and aren't planning to send a pull request to `HHAST`, you might want to ignore whitespace in auto-fixing AST linters: getting whitespace correct is generally more consuming than the logical change itself. Instead, you could ask your users to run `git show | hackfmt --diff`, or add a non-AST autofixing linter to do that instead

### Whitespace and comments

Usually the hardest part of writing an auto-fixing linter or a migration is
dealing with whitespace and comments (e.g. preserving indentation).

If you're replacing a single node, the easiest solution is to just copy the
whitespace and comments (in HHAST these are called `Trivia`) from the original
node:

- pass `$original_node->getFirstTokenx()->getLeading()` to the constructor of
  the first token of your replacement
- pass `$original_node->getLastTokenx()->getTrailing()` to the constructor of
  the last token of your replacement
- if the original node contains more than one token (which is probably in most
  cases), there are leading and trailing `Trivia` attached to each
  token&mdash;consider whether these need to be copied over to specific tokens
  in your replacement, so as to not lose any comments or FIXMEs from the
  original code
- make sure to add test cases with different amounts of whitespace and comments
  before, after and in the middle (if applicable) of the node being replaced

For more complicated scenarios (not replacing a single node with a single new
node), you may need to manually implement an appropriate way to handle all the
trivia, but there are some helper functions for common operations:

- [`append_to_nodelist()`](https://github.com/hhvm/hhast/blob/master/src/Migrations/append_to_nodelist.hack#L15)
- [`prepend_statements()`](https://github.com/hhvm/hhast/blob/master/src/Migrations/prepend_statements.hack#L15)
- [`whitespace_from_nodelist()`](https://github.com/hhvm/hhast/blob/master/src/__Private/whitespace_from_nodelist.hack#L15)
  is completely general (it can help with adding nodes to any `NodeList`) but
  not as easy to use (both of the functions above use it, so look there for
  example code)
