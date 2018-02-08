#!/bin/sh
set -ex
hhvm --version

composer install --ignore-platform-reqs

hh_client

vendor/bin/hh-codegen-verify-signatures codegen/

hhvm vendor/bin/phpunit tests/

hhvm bin/hhast-lint --perf

echo > .hhconfig
hh_server --check $(pwd)
