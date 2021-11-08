# Contributing to HHAST
We want to make contributing to this project as easy and transparent as
possible.

## Our Development Process
We develop HHAST purely on GitHub, and welcome pull requests.

## Major Components
 - `codegen/schema.json`: this is regenerated from `hh_parse --schema`, and is
   usually only updated when there is a new future or change in the Hack
   language itself. It is unlikely you'll need to update this.
 - `codegen/inferred_relationships.php`: a list of what types we consider valid
   in each field of each kind of AST node; as this isn't included in the schema,
   it is inferred from the HHVM and Hack unit tests. This should only need to
   be regenerated when there are changes to the Hack language itself. It is
   unlikely you'll need to update this, and regenerating it is *very* slow.
 - the base classes for AST nodes: `src/{Node,Token,List}.php`: these
   are hand-written, and changes to functionality that don't require
   per-subclass type information should go here
 - the remainder of `codegen/`: these are subclasses of
   `{Node,Token,List}` - one for each kind of node that exists in the
   AST schema. These classes should only contain methods that can not be
   correctly implemented in the hand-written base classes. If you need to
   extend any of these, **do not modify them directly** - instead, edit the
   code that generates them in `src/__Private/codegen/`, and run
   `bin/update-codegen`.
 - the linter framework
 - the migration framework

## Pull Requests
We actively welcome your pull requests.
1. Fork the repo and create your branch from `master`.
2. If you've added code that should be tested, add tests
3. Ensure that:
 - the test suite passes (run `vendor/bin/hacktest tests`)
 - all linters pass (run `bin/hhast-lint`)
 - the codegen regenerates with no changes
4. If you haven't already, complete the Contributor License Agreement ("CLA").

We generally won't accept pull requests that add functionality that is duplicated in `hh_client` or `hackfmt`; if you think a situation is worth an exception, please file an issue first for discussion to reduce wasted time.

## Contributor License Agreement ("CLA")
In order to accept your pull request, we need you to submit a CLA. You only need
to do this once to work on any of Facebook's open source projects.

Complete your CLA here: <https://code.facebook.com/cla>

## Issues
We use GitHub issues to track public bugs. Please ensure your description is
clear and has sufficient instructions to be able to reproduce the issue.

Facebook has a [bounty program](https://www.facebook.com/whitehat/) for the safe
disclosure of security bugs. In those cases, please go through the process
outlined on that page and do not file a public issue.

## Coding Style

* 2 spaces for indentation rather than tabs
* 80 character line length
* Be consistent with existing code
* Be consistent with `hackfmt`

We do not follow the PSR guidelines.


## License

By contributing HHAST, you agree that your contributions will be licensed
under the LICENSE file in the root directory of this source tree.
