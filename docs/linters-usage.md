# HHAST: Using Linters In Your Project

## Quick Start

```
hhvm composer require hhvm/hhast
vendor/bin/hhast-lint src/
```

This will run a default set of linters against your source tree. If you do not have a configuration file, paths must be specified on the command line.

## Configuration

An `hhast-lint.json` in your project root can be used to modify which linters are used, or to otherwise customize the behavior. A minimal configuration would be:

```
{
  "roots": [ "src/" ]
}
```

This would configure `hhast-lint` with no arguments check `src/` with otherwise-default settings. For information on additional options, see [`LinterCLIConfig::TConfigFile`](../src/__Private/LinterCLIConfig).

Options can also be overriden for specific file patterns or subdirectories - for example, [HHAST itself](../hhast-lint.json) disables autofixes for `codegen/`.
