# HHAST: Migrations

Migrations are designed to operate across a code base, without any additional input.

## Usage

```
$ git clone https://github.com/hhvm/hhast.git
$ php composer.phar install # use PHP, not HHVM
$ bin/hhast-migrate --help
Usage: bin/hhast-migrate [OPTIONS] PATH [PATH ...]

Options:
  --implicit-shape-subtypes
	Allow implicit structural subtyping of all shapes
  --optional-shape-fields
	Migrate nullable shape fields to be both nullable and optional
  --hhvm-3.22-to-3.23
	Apply all migrations for moving from 3.22 to 3.23
  -h, --help
	display this text and exit
```

Run `hhast-migrate` specifying the migrations you want to run, and the paths to apply it to; for example:

```
$ bin/hhast-migrate --hhvm-3.22-to-3.23 ~/code/myproject/src/
```
