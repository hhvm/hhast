#!/bin/sh
set -ex
hhvm --version

composer install --ignore-platform-reqs

hh_client

hhvm vendor/bin/hacktest tests/

vendor/bin/hh-codegen-verify-signatures codegen/

hhvm bin/hhast-lint
