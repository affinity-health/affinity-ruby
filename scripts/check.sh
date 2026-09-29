#!/bin/sh
set -eu
cd "$(dirname "$0")/.."
docker run --rm -v "$PWD:/source:ro" -v "$PWD/tests:/tests:ro" ruby:3.3 sh /tests/verify-ruby.sh
