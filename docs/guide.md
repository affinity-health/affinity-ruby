# Ruby SDK proposal

> **Proposed interface.**
  These examples describe the SDK we plan to build. They are for review and do not run against the
  current release. Package versions and migration steps will follow approval.


Ruby server applications. Request data and options use separate hashes, following Stripe Ruby. [Source repository](https://github.com/affinity-health/affinity-ruby) · [All SDKs](https://docs.joinaffinityai.com/guides/reference/sdks/)

## Connect

Set `AFFINITY_API_KEY` to a Test API key on your server. The key selects Test or Live mode. Keep it out of browser and mobile code.

```ruby
require "affinity"

api = Affinity::Client.new(ENV.fetch("AFFINITY_API_KEY"))
```

## With a practice key

The key identifies the practice. No practice ID or scoped client is needed.
The resource IDs below come from records in that practice.
Each section is a separate usage example, not one script to concatenate.

```ruby
patients = api.patients.list({ limit: 20 })
patient = api.patients.get(patient_id)
items = api.catalog.items.list({ limit: 20 })
```

## With a platform key

Pass the target practice with each practice-scoped request. Keep record data separate from request context and idempotency options.

```ruby
patients = api.patients.list(
  { limit: 20 },
  { practice_id: practice_id }
)

patient = api.patients.get(patient_id, { practice_id: practice_id })

api.patients.update(
  patient_id,
  { email: "alex@example.com" },
  { practice_id: practice_id }
)

```

## Scope a workflow once

A scoped client remembers the practice for subsequent requests. It is immutable; the original client and other scoped clients stay independent.
A conflicting practice ID produces an error. Scoping never grants access to another practice.

```ruby
practice = api.for_practice(practice_id)

patients = practice.patients.list({ limit: 20 })
items = practice.catalog.items.list({ limit: 20 })
```

The following examples use this scoped client. A practice-key client supports the same calls without the scoping step.

## Create, get, and update a patient

Use synthetic Test data. Routine writes generate a fresh idempotency key per call and preserve it during internal retries.
Supply your own persisted key when retrying across calls or process restarts.

```ruby
patient = practice.patients.create({
  name: { first: "Alex", last: "Example" },
  date_of_birth: "1990-01-01"
})

saved = practice.patients.get(patient.id)
practice.patients.update(patient.id, { email: "alex@example.com" })
practice.patients.update(patient.id, { status: "archived" })
```

Archive patients whose records you need to retain. Permanent deletion is available only for patients without order history. No explicit idempotency key is needed.

```ruby
practice.patients.delete(patient_id)
```

## Create an order draft

`draft` is your application's prepared prescription data, using catalog and prescribing options from this practice.
An order contains 1–20 complete prescriptions for one patient. This example creates an unsigned draft.
It shows a platform call without a scoped client: practice context and the persisted key belong together in request options.

`job` is your persisted workflow record. Generate and save a unique key for each action before making its first request.

```ruby
order = api.orders.create(
  { patient_id: patient_id, prescriptions: draft.prescriptions },
  { practice_id: practice_id, idempotency_key: job.create_order_key }
)

```

## Sign and submit

`review` is your saved clinician review and signing consent for this exact order.
Store the reviewed revision, authorized prescriber ID, and explicit attestation together.
Your API key needs `orders:sign`. Never infer consent or automatically replace a stale revision.

```ruby
practice.orders.sign(
  order_id,
  {
    prescriber: { id: review.prescriber_id },
    expected_revision: review.order_revision,
    signature_attestation: review.signature_attestation
  },
  { idempotency_key: job.sign_order_key }
)

submission = practice.orders.submit(order_id, {
  idempotency_key: job.submit_order_key
})
```

Use separate keys for creating, signing, and submitting. After an uncertain response, retry the same action with the same key and unchanged data.
A revision conflict requires renewed clinician review before another signing attempt.

Submission means queued, not accepted by the pharmacy. Inspect the result and track order events or webhooks.
After a reported partial submission failure, retry only the unconfirmed send with a new submission key.

## Read more than one page

The list method returns one page. Pass the last record's ID to request the next page.
The iterator fetches pages as you consume records; it does not load the full collection into memory.
`syncPatient` or its language equivalent represents your application's record handler.

```ruby
page = practice.patients.list({ limit: 20 })

if page.has_more && !page.data.empty?
  next_page = practice.patients.list({
    limit: 20,
    starting_after: page.data.last.id
  })
end

practice.patients.iterate({ limit: 100 }).each do |patient|
  sync_patient(patient)
end
```

## Handle errors

API failures expose status, code, request ID, retryability, and an optional retry delay in seconds.
Log those fields without logging patient data or credentials. Transport failures remain distinguishable from API responses.

```ruby
begin
  practice.patients.get(patient_id)
rescue Affinity::Error => error
  warn({
    status: error.status,
    code: error.code,
    request_id: error.request_id,
    retryable: error.retryable,
    retry_after: error.retry_after
  }.inspect)
end
```

Retryability is a transport hint, not permission to repeat a clinical action with a new key.
Keep the same key and body for an uncertain write. Validation and authorization errors require a corrected request.
See [API errors](https://docs.joinaffinityai.com/errors/) for recovery guidance.

## Platform directory and webhooks

Use the root platform client to list its practices and webhook endpoints. These calls do not need a target practice or an idempotency key.
The webhook list belongs to the platform itself. Access to another organization's endpoints still requires an explicit grant.

```ruby
practices = api.practices.list({ limit: 20 })
selected = api.practices.get(practice_id)
endpoints = api.webhooks.endpoints.list({ limit: 20 })
```

## More resources

Use the same conventions for addresses, allergies, locations, team members, and nested order resources.
[API reference](https://docs.joinaffinityai.com/api/) · [Webhooks](https://docs.joinaffinityai.com/guides/webhooks/)
