require "affinity"
require "ostruct"
def sync_patient(patient); end

api=Affinity::Client.new("test",base_url:"http://127.0.0.1:5199/ruby-docs-practice-0")
practice_id,patient_id,order_id="prac_a","pat_a","ord_a"
practice=api.for_practice(practice_id)
draft=OpenStruct.new(prescriptions:[])
job=OpenStruct.new(create_order_key:"create",sign_order_key:"sign",submit_order_key:"submit")
review=OpenStruct.new(prescriber_id:"prov_a",order_revision:"rev_a",signature_attestation:true)
patients = api.patients.list({ limit: 20 })
patient = api.patients.get(patient_id)
items = api.catalog.items.list({ limit: 20 })


api=Affinity::Client.new("test",base_url:"http://127.0.0.1:5199/ruby-docs-platform-1")
practice_id,patient_id,order_id="prac_a","pat_a","ord_a"
practice=api.for_practice(practice_id)
draft=OpenStruct.new(prescriptions:[])
job=OpenStruct.new(create_order_key:"create",sign_order_key:"sign",submit_order_key:"submit")
review=OpenStruct.new(prescriber_id:"prov_a",order_revision:"rev_a",signature_attestation:true)
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



api=Affinity::Client.new("test",base_url:"http://127.0.0.1:5199/ruby-docs-platform-2")
practice_id,patient_id,order_id="prac_a","pat_a","ord_a"
practice=api.for_practice(practice_id)
draft=OpenStruct.new(prescriptions:[])
job=OpenStruct.new(create_order_key:"create",sign_order_key:"sign",submit_order_key:"submit")
review=OpenStruct.new(prescriber_id:"prov_a",order_revision:"rev_a",signature_attestation:true)
practice = api.for_practice(practice_id)

patients = practice.patients.list({ limit: 20 })
items = practice.catalog.items.list({ limit: 20 })


api=Affinity::Client.new("test",base_url:"http://127.0.0.1:5199/ruby-docs-platform-3")
practice_id,patient_id,order_id="prac_a","pat_a","ord_a"
practice=api.for_practice(practice_id)
draft=OpenStruct.new(prescriptions:[])
job=OpenStruct.new(create_order_key:"create",sign_order_key:"sign",submit_order_key:"submit")
review=OpenStruct.new(prescriber_id:"prov_a",order_revision:"rev_a",signature_attestation:true)
patient = practice.patients.create({
  name: { first: "Alex", last: "Example" },
  date_of_birth: "1990-01-01"
})

saved = practice.patients.get(patient.id)
practice.patients.update(patient.id, { email: "alex@example.com" })
practice.patients.update(patient.id, { status: "archived" })


api=Affinity::Client.new("test",base_url:"http://127.0.0.1:5199/ruby-docs-platform-4")
practice_id,patient_id,order_id="prac_a","pat_a","ord_a"
practice=api.for_practice(practice_id)
draft=OpenStruct.new(prescriptions:[])
job=OpenStruct.new(create_order_key:"create",sign_order_key:"sign",submit_order_key:"submit")
review=OpenStruct.new(prescriber_id:"prov_a",order_revision:"rev_a",signature_attestation:true)
practice.patients.delete(patient_id)


api=Affinity::Client.new("test",base_url:"http://127.0.0.1:5199/ruby-docs-platform-5")
practice_id,patient_id,order_id="prac_a","pat_a","ord_a"
practice=api.for_practice(practice_id)
draft=OpenStruct.new(prescriptions:[])
job=OpenStruct.new(create_order_key:"create",sign_order_key:"sign",submit_order_key:"submit")
review=OpenStruct.new(prescriber_id:"prov_a",order_revision:"rev_a",signature_attestation:true)
order = api.orders.create(
  { patient_id: patient_id, prescriptions: draft.prescriptions },
  { practice_id: practice_id, idempotency_key: job.create_order_key }
)



api=Affinity::Client.new("test",base_url:"http://127.0.0.1:5199/ruby-docs-platform-6")
practice_id,patient_id,order_id="prac_a","pat_a","ord_a"
practice=api.for_practice(practice_id)
draft=OpenStruct.new(prescriptions:[])
job=OpenStruct.new(create_order_key:"create",sign_order_key:"sign",submit_order_key:"submit")
review=OpenStruct.new(prescriber_id:"prov_a",order_revision:"rev_a",signature_attestation:true)
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


api=Affinity::Client.new("test",base_url:"http://127.0.0.1:5199/ruby-docs-platform-7")
practice_id,patient_id,order_id="prac_a","pat_a","ord_a"
practice=api.for_practice(practice_id)
draft=OpenStruct.new(prescriptions:[])
job=OpenStruct.new(create_order_key:"create",sign_order_key:"sign",submit_order_key:"submit")
review=OpenStruct.new(prescriber_id:"prov_a",order_revision:"rev_a",signature_attestation:true)
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


api=Affinity::Client.new("test",base_url:"http://127.0.0.1:5199/ruby-docs-platform-8")
practice_id,patient_id,order_id="prac_a","pat_a","ord_a"
practice=api.for_practice(practice_id)
draft=OpenStruct.new(prescriptions:[])
job=OpenStruct.new(create_order_key:"create",sign_order_key:"sign",submit_order_key:"submit")
review=OpenStruct.new(prescriber_id:"prov_a",order_revision:"rev_a",signature_attestation:true)
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


api=Affinity::Client.new("test",base_url:"http://127.0.0.1:5199/ruby-docs-platform-9")
practice_id,patient_id,order_id="prac_a","pat_a","ord_a"
practice=api.for_practice(practice_id)
draft=OpenStruct.new(prescriptions:[])
job=OpenStruct.new(create_order_key:"create",sign_order_key:"sign",submit_order_key:"submit")
review=OpenStruct.new(prescriber_id:"prov_a",order_revision:"rev_a",signature_attestation:true)
practices = api.practices.list({ limit: 20 })
selected = api.practices.get(practice_id)
endpoints = api.webhooks.endpoints.list({ limit: 20 })

