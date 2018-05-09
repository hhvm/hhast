# HHAST: Developing Linters

## Linter Base Classes

 - [`BaseLinter`](../src/Linters/BaseLinter.php): base class of all linters, and independent from the AST
 - [`BaseASTLinter`](../src/Linters/BaseASTLinter.php): base class for linters that operate on AST nodes; you shouldn't usually extend this directly; you probably want either `ASTLinter` or `AutoFixingASTLinter` instead. You'll need to extend this if you want to use the AST to detect an issue, but an approach other than AST manipulation to automatically fix them (e.g. shelling out to `hh_client --refactor`)
 - [`ASTLinter`](../src/Linters/ASTLinter.php): base class for linters that use the AST to detect issues, but don't have an auto-fix
 - [`AutoFixingLinter`](../src/Linters/AutoFixingLinter.php): an interface that specifies that a linter is able to fix   its' own lint problems
 - [`AutoFixingASTLinter`](../src/Linters/AutoFixingASTLinter.php): a subclass of `ASTLinter` which implements `AutoFixingLinter`, for when your auto-fix is based on an AST mutation
 - [`FunctionNamingLinterTrait`](../src/Linters/FunctionNamingLinterTrait): helper for `ASTLinter` subclasses

## Error Base Classes

 - [`LintError`](../src/Linters/LintError.php): base of all linter errors. It allows you to provide a description, and blame text (usually code)
 - [`FixableLintError`](../src/Linters/FixableLintError.php): interface for lint errors that might be fixable. It specifies how to fix them, and a way to describe the fix. The error is actually fixed by passing the error to the linters' fix method
 - [`ASTLintError`](../src/Linters/ASTLintError.php): subclass of `LintError` for linters that derive from `BaseASTLintError`, but not `AutoFixingASTLintError`
 - [`FixableASTLintError`](../src/Linters/FixableASTLintError.php): subclass of `ASTLintError` for linters that are a subclass of `AutoFixingASTLinter`

## Getting Started

The best way is to read through [the existing linters](../src/Linters/) to get a feel for what's supported, and what works well.

It's best to heavily use unit tests when working on linters; once your tests pass and you're ready to get started, add it to your `hhast-lint.json`.

## Advice

 - install `jq` or another JSON prettifier, and examine files containing AST structures you're interested in with `hh_parse --full-fidelity-json $file | jq`
 - use an IDE with autocompletion; there are far too many AST node types for memorizing the APIs to be practical
 - include various combinations of leading and trailing whitespace and comments in your unit tests for auto-fixing linters
 - if you use `hackfmt` and aren't planning to send a pull request to `HHAST`, you might want to ignore whitespace in auto-fixing AST linters: getting whitespace correct is generally more consuming than the logical change itself. Instead, you could ask your users to run `git show | hackfmt --diff`, or add a non-AST autofixing linter to do that instead
