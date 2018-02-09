#!/bin/sh
set -ex
hhvm --version

composer install --ignore-platform-reqs

hh_client

vendor/bin/hh-codegen-verify-signatures codegen/

hhvm vendor/bin/phpunit

hhvm bin/hhast-lint --perf

# Make sure we pass when a release is required
EXPORT_DIR=$(mktemp -d)
git archive --format=tar.gz -o "${EXPORT_DIR}/exported.tar.gz" HEAD
cd "$EXPORT_DIR"
tar xfv exported.tar.gz
composer install --no-dev
echo > .hhconfig
hh_server --check $(pwd)
