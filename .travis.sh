#!/bin/sh
set -ex
hhvm --version

composer install --ignore-platform-reqs

hh_client

hhvm vendor/bin/hacktest tests/

vendor/bin/hh-codegen-verify-signatures codegen/

hhvm bin/hhast-lint

# Make sure we pass when a release is required
EXPORT_DIR=$(mktemp -d)
git archive --format=tar -o "${EXPORT_DIR}/exported.tar" HEAD
cd "$EXPORT_DIR"
tar -xf exported.tar
composer install --no-dev
