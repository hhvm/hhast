HHAST is closely coupled to Hack's syntax tree, so if the schema of `hh_parse`
changes, HHAST needs updating.

1. Get a github codespace or use vscode devcontainers. If a codespace, pick the biggest one you can for this (in general, the smallest are good enough, but here more power is useful).
2. Edit `/etc/apt/sources.list` - remove `-4.x` suffix from dl.hhvm.com repository
3. `apt update; apt remove -y hhvm; apt install -y hhvm-nightly` (or `apt install hhvm` for latest stable release)
4. `cd /workspaces; git clone --depth 1 https://github.com/facebook/hhvm.git`
5. `cd hhast`
6. `bin/update-schema --hhvm-path=/workspaces/hhvm`
7. wait 5-15 minutes as it parses and analyzes the hack/hhvm unit tests to infer valid node relationships
8. `git diff codegen/schema.json codegen/inferred_relationships.hack` - are the schema changes going to change how code that is valid on both versions is represented?
9. Adjust `src/__Private/is_compatible_schema_version.hack`, following the instructions in the code comments
10. Fix `hh_client`, `bin/hhast-lint`, and `vendor/bin/hacktest tests/` errors
11. If the changes are not backwards compatible, update the minimum versions in composer.json and .github/workflows/ci.yaml
12. Create pull request
13. Once merged and CI is green on main branch, tag a new release, matching the new minimum HHVM version

- If the maintainer decides to merge the PR to update schema to a backward compatible version, and `SCHEMA_VERSION` is changed, the maintainer should also [tag a `vx.yyy.z` HHAST release](https://github.com/hhvm/hhast/releases/new), where `x.yyy` should be the required HHVM version at https://github.com/hhvm/hhast/blob/main/composer.json#L24, and `z` is the next previous version number plus 1.
- If the maintainer decides to merge the PR to update schema with a breaking change, the maintainer should also tag a `vx.yyy.0` HHAST release, where `x.yyy` should be the required HHVM version at https://github.com/hhvm/hhast/blob/main/composer.json#L24.

* If some valid node relationships are banned:
  1. Add a SyntaxExample file to src/__Private/codegen/data/
  2. `git clean -ffdx codegen/; git checkout codegen/`
  3. re-run the original steps starting with `bin/update-schema --hhvm-path=/workspaces/hhvm`
* CI also runs all the test steps; doing it yourself just saves time.