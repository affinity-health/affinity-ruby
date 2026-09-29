#!/bin/sh
set -eu
cp -R /source /tmp/sdk
cd /tmp/sdk
ruby -Ilib /tests/ruby_smoke.rb
gem build Affinity.gemspec
gem install --local affinity-health-sdk-0.1.0.gem --no-document
ruby -e 'require "affinity"; abort unless Affinity::VERSION == "0.1.0"'
