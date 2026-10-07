#!/bin/sh
set -eu
cp -R /source /tmp/sdk
cd /tmp/sdk
ruby -Ilib /tests/ruby_smoke.rb
gem build Affinity.gemspec
gem install --local affinity-health-sdk-*.gem --no-document
ruby -e 'require "affinity"; spec = Gem::Specification.find_by_name("affinity-health-sdk"); abort unless Affinity::VERSION == spec.version.to_s'

if [ -f /tests/approved-ruby.rb ]; then ruby -Ilib /tests/approved-ruby.rb; else ruby -Ilib /tests/approved.rb; fi
if [ -f tests/docs_approved.rb ]; then ruby -Ilib tests/docs_approved.rb; fi
