## Configuring HHAST lint

_This file explains what each section of hhast-lint.json does and how to use it._

_If you want to look at the source code that implements these rules, see [LintRunConfig.hack](https://github.com/hhvm/hhast/blob/main/src/__Private/LintRunConfig.hack)_.

The configuration file is case sensitive and the `lowerCamelCase` naming convention is used.

### roots

You are required to tell hhast where the source code that you want to lint is located.
This is done by providing `roots`. `roots` contains a list of file paths relative to
the location of `hhast-lint.json`. For a project with a `src/` and `tests/` directory,
you could configure hhast like this.

```JSON
{
  "roots": ["src/", "tests/"]
}
```

If your project contains source files that you want to lint in the same directory
as `hhast-lint.json`, you can use the `.` path. The `.` path is interpreted as:
Lint everything in the directory in which `hhast-lint.json` is located and all
recursive subdirectories. Anything that the command line tool `tree` shows
would be linted. This includes `vendor/`, which you should not lint. You can provide
an override to exclude `vendor/` like so.

```JSON
{
  "roots": ["."],
  "overrides": [
    {
      "patterns": [
        "vendor/*"
      ],
      "disableAllLinters": true
    }
  ]
}
```

### builtinLinters

The HHAST framework comes bundled with some pre-built linters. These linters are divided,
into two groups: `DEFAULT_LINTERS` and `NON_DEFAULT_LINTERS`. The two lists can be found
in [LintRunConfig.hack](https://github.com/hhvm/hhast/blob/main/src/__Private/LintRunConfig.hack).

The value of `builtinLinters` is a quick way to select none, `DEFAULT_LINTERS`, or
`DEFAULT_LINTERS` + `NON_DEFAULT_LINTERS`. `"default"` is the default value, and includes
all linters from the `DEFAULT_LINTERS` list. `"all"` includes all linters from either list.
My personal recommendation for active projects is to set this option to `"all"` and [exclude
linters on a case by case basis](#disabledLinters).

```JSON
{
  "roots": ["src/", "tests/"],
  "builtinLinters": "all"
}
```

The value `"none"` is meant for users who prefer backwards compatibility. New versions
of hhast will include new linters. If you have set up your CI pipeline to stop when
a lint error is detected, upgrading to the new version of hhast could stop your builds.
If you want full control over which linters you adopt and when, set `builtinLinters` to
`"none"` and [list all desired linters by name](#extraLinters).

### extraLinters

The `extraLinters` option can be used to enable linters by qualified classname.
This option can be used in combination with `"builtinLinters": "none"` to enable only the
linters you name here.

```JSON
{
  "roots": ["src/", "tests/"],
  "builtinLinters": "none",
  "extraLinters": [
    "Facebook\\HHAST\\DontAwaitInALoopLinter"
  ]
}
```

`extraLinters` is not limited to linters included with HHAST. You can specify any
linter, including third-party or self-written linters. One example would be a linter
that emits an error when your repeat type information in a docblock.

```HACK
// ExcludeParameterTypeInformationFromDocBlocksLinter: Don't repeat your types
/**
 * @param int $devisor must be non-zero
 */
function devide_integers(int $dividend, int $divisor): int {
  return Math\int_div($dividend, $devisor);
}
```

```JSON
{
  "roots": ["src/", "tests/"],
  "builtinLinters": "all",
  "extraLinters": [
    "YourCode\\ExcludeParameterTypeInformationFromDocBlocksLinter"
  ]
}
```

### disabledLinters

`disabledLinters` excludes linters from use. This is useful in [overrides](#overrides).
You can use this at the top-level too. For when one or more linters from `builtinLinters`
conflicts with a third-party linter.

```JSON
{
  "roots": ["src/", "tests/"],
  "builtinLinters": "all",
  "extraLinters": [
    "ExampleDotCom\\PascalCaseEnumMembersLinter"
  ],
  "disabledLinters": [
    "Facebook\\HHAST\\ShoutCaseEnumMembersLinter"
  ]
}
```

### disabledAutoFixes and disableAllAutoFixes

Some linters in hhast include autofixes. An autofix is a change to your code that
satisfies that linter. This change can be made by running hhast from the command-line
and accepting the suggested autofix. Alternatively, you can use IDE features to accept
a suggested autofix. _Hhast will never change your code without your permission._

If you don't like the autofix output from one or more linters, you can add the
qualified classname to the `disabledAutoFixes` list to prevent hhast from prompting
you with a fix.

```JSON
{
  "roots": ["src/", "tests/"],
  "builtinLinters": "all",
  "disabledAutoFixes": [
    "Facebook\\HHAST\\ConsistentLineEndingsLinter"
  ]
}
```

With this config, you would not be prompted with:
`Would you like to apply this fix?` for `ConsistentLineEndings` errors.

`disableAllAutoFixes` behaves similarly to `disabledAutoFixes`, but it is a boolean
option. `"disableAllAutoFixes": true` is equivalent to `"disabledAutoFixes": [all linters]`.

### linterConfigs

Some linters in hhast can have their behavior changed through configuration options.
The `linterConfigs` option is an object where the keys are the qualified classnames
and the values are of a linter defined `TConfig` type. You must look at the `TConfig`
type constant in the linter class to learn about the configuration options for that linter.

[DontCreateForwardingLambdasLinter](https://github.com/hhvm/hhast/blob/main/src/Linters/DontCreateForwardingLambdasLinter.hack#L15)
is an example of a configurable linter. If you want to allow typed forwarding lambdas,
you'd use this config.

```JSON
{
  "roots": ["src/", "tests/"],
  "builtinLinters": "all",
  "linterConfigs": {
    "Facebook\\HHAST\\DontCreateForwardingLambdasLinter": {
      "noErrorForLambdaWithTypedParametersOrReturn": true
    }
  }
}
```

```HACK
function takes_a_generic_t<T>(T $t): string { /* ... */ }

function process_ints(vec<int> $ints): vec<string> {
  // Without the linter config, this would be a lint error.
  return Vec\map($ints, (int $i) ==> takes_a_generic_t<int>($i));
}
```

### namespaceAliases

Many options in `hhast-lint.json` take a list of qualified classnames. With the
`namespaceAliases` option you can declare a short prefix to be expanded into
the real namespace prefix.

Aliases don't have to start with an `@` sign, but this is something I recommend.
This makes it obvious that namespace aliassing is taking place.

```JSON
{
  "roots": ["src/", "tests/"],
  "builtinLinters": "none",
  "extraLinters": [
    "@H\\DontAwaitInALoopLinter"
  ],
  "namespaceAliases": {
    "@H": "Facebook\\HHAST"
  }
}
```

The following options support namespace aliasing:

 - extraLinters
 - disabledLinters
 - disabledAutofixes

At the time of writing, `linterConfigs` ignores namespace aliases.
This following does not work:
```JSON
{
  "roots": ["src/", "tests/"],
  "builtinLinters": "none",
  "linterConfigs": {
    "@H\\DontCreateForwardingLambdasLinter": {
      "noErrorForLambdaWithTypedParametersOrReturn": true
    }
  }
  "namespaceAliases": {
    "@H": "Facebook\\HHAST"
  }
}
```

### overrides

Overrides create exceptions to the top-level configuration for specific file paths.
An override must have a `pattern` key. This key is interpreted by `fnmatch()`
and the settings declared in the block take effect on all matching paths.
If multiple overrides match for a single path, the first match is considered.

 - `builtinLinters`, overwrite the value of `builtinLinters` at top-level configuration.
   - This has no effect on built-in linters specified in `disabledLinters` and `extraLinters`.
 - `extraLinters`, appends a list of linters to `extraLinters` from the top-level configuration. 
   - Linters listed in `disabledLinters` won't be enabled, even if mentioned in `extraLinters`.
 - `disabledLinters`, appends a list of linters to `disabledLinters` from the top-level configuration.
   - `disabledLinters`, overrules `extraLinters` and `builtinLinters` from top-level and override sections.
 - `disabledAutoFixes`, appends a list of linters to `disabledAutoFixes` from the top-level configuration.
 - `disableAllAutoFixes`, disables all autofixes unconditionally, irregardless of other options.
 - `disableAllLinters`, disables all linters unconditionally, irregardless of other options.
 - `linterConfigs`, merges linter configs on a class-by-class level, overrides win in case of conflict.
   - If the override supplies a config for `ExampleLinter`, the top-level linter config is ignored for `ExampleLinter`.

```JSON
{
  "roots": [ "src/", "tests/" ],
  "builtinLinters": "default",
  "extraLinters": [
    "ExampleDotCom\\UseSafeWrapperFunctionsLinter"
  ],
  "overrides": [
    {
      "patterns": [ "src/codegen/*" ],
      "disabledLinters": [
        "Facebook\\HHAST\\UnusedUseClauseLinter"
      ],
      "disableAllAutofixes": true
    },
    {
      "patterns": [ "src/lib/*" ],
      "builtinLinters": "all"
    },
    {
      "patterns": [ "src/third-party/*" ],
      "disableAllLinters": true
    },
    {
      "patterns": [ "tests/*" ],
      "disabledLinters": [
         "Facebook\\HHAST\\CamelCasedMethodsUnderscoredFunctionsLinter"
      ]
    }
  ],
}
```

This is a hypothetical example of how `overrides` can be used.
Here is the file structure of this hypothetical project:
```
 |-- src
 |   | -- app
 |   | -- codegen
 |   | -- lib
 |   | -- third-party
 |
 |-- tests
```

This project lints with the `"default"` built-in linters, plus `ExampleDotCom\\UseSafeWrapperFunctionsLinter`.

In codegen, it is allowed to `use namespace ExampleDotCom\\Some`, without using `Some` in the file.
The codegen tool does not need to keep track of which namespaces it uses, so `UnusedUseClauseLinter`
is added to `disabledLinters`.

The code generator will, if it can prove that doing so is safe, codegen calls to unsafe
functions which skip some safety checks. For example, `$db->executeRawSqlAsync__UNSAFE(...)`.
The codegen tool will emit a `/*HHAST_IGNORE_ERROR[UseSafeWrapperFunctions] see internal ticket 1234*/`
comment to explain why it is using an unsafe sql query.

It does not make sense to apply autofixes to codegen, because they will be overwritten, so
`disableAllAutofixes` is set.

The src/lib directory is held to a higher standard. All hhast linters apply there,
because `"builtinLinters": "all"` overrides the top-level `"default"`.

The src/third-party directory contains libraries that don't have nice packages.
These files should not be edited, to keep upgrading to newer versions easy. This is why
all linters are disabled in this directory.

The tests/ directory contains thousands of test methods in camel case.
```HACK
final class MyTest extends HackTest {
  public function test_it_does_do_the_thing(): void { /*...*/ }
}
```

Changing these methods would cause useless churn, so `CamelCasedMethodsUnderscoredFunctionsLinter` is disabled.
