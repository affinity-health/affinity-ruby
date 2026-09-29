# Affinity Ruby SDK

[Proposed SDK guide](docs/guide.md) · Review the next interface for practice keys, platforms, patient records, and order signing. These examples are not implemented yet.

Generated client for the Affinity API, version `2026-09-28`. This is a source preview
at `0.2.0`; the generated interface may change before a stable release.

## Install and use

Requires Ruby 3.3 or newer. Add the GitHub source to your Gemfile:

```ruby
gem "affinity-health-sdk", git: "https://github.com/affinity-health/affinity-ruby", branch: "main"
```

Run `bundle install`, then:

```ruby
require "affinity"

client = Affinity::Client.new(api_key: ENV.fetch("AFFINITY_API_KEY"), max_retries: 0)
page = client.orders.list(
  limit: 20
)
puts page.data.length
```

Set `affinity_version:` once on the client to override the API version. Write methods that
require idempotency accept `idempotency_key:`. This gem is not published on RubyGems.

Use a server-side API key from `AFFINITY_API_KEY`. Never embed keys in a browser or
shipped application. The default base URL is `https://api.joinaffinityai.com`.
These examples disable automatic retries. Reuse the same idempotency key when
retrying a write that requires one. List responses expose data and cursor metadata;
pass the next cursor explicitly when fetching more records.

See [the generated reference](reference.md) for resource methods and types and
[Affinity documentation](https://docs.joinaffinityai.com) for API behavior.
Generated reference examples may assume registry publication; use the installation
instructions above while this SDK is available only from GitHub.

## Development

With Docker installed:

```sh
./scripts/check.sh
```

This builds/packages the SDK locally and checks synthetic HTTP requests, authentication,
API version headers, pagination parameters, response decoding, and failed writes.
It does not call the hosted API or publish a package.

The committed [OpenAPI contract](spec/affinity.openapi.json) is the source of truth.
[generation.json](generation.json) records the pinned Cloudflare Forge and Fern
versions and source hash. Generation is maintained in Affinity's SDK pipeline.
Do not edit generated models directly.

## Guide

Read the [Ruby guide](https://docs.joinaffinityai.com/guides/reference/sdks/ruby/) for patients, catalog items, writes, pagination, and errors.

Version 0.2.0 defaults to API `2026-09-28`, no automatic retries, and a 60-second timeout.
Explicit client and request options override these defaults. Custom HTTP transports manage their own timeout support.
