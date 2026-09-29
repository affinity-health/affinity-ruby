require 'affinity'
require 'net/http'
require 'json'
base='http://127.0.0.1:5199/ruby-practice-retry'
Net::HTTP.get(URI(base+'/reset'))
api=Affinity::Client.new('test',base_url:base,max_retries:1)
patient=api.patients.create({name:{first:'Alex',last:'Example'},date_of_birth:'1990-01-01'})
raise 'patient' unless patient.id=='pat_a'
api.patients.update(patient.id,{email:nil})
api.patients.delete(patient.id)
raise 'pagination' unless api.patients.iterate({limit:1,query:'Alex'}).map(&:id).to_a==['pat_a','pat_b']
begin;api.patients.get('pat_a',{practice_id:'prac_b'});raise 'mismatch accepted';rescue ArgumentError;end
begin;api.orders.submit('ord_a');raise 'missing key accepted';rescue ArgumentError;end
api.orders.sign('ord_a',{prescriber:{id:'prov_a'},expected_revision:'rev_reviewed',signature_attestation:true},{idempotency_key:'sign_job'})
api.orders.submit('ord_a',{idempotency_key:'submit_job'})
begin;api.patients.get('pat_error');raise 'missing error';rescue Affinity::Error=>e;raise 'error fields' unless e.status==429&&e.code=='rate_limited'&&e.request_id=='req_a'&&e.retry_after==0&&e.retryable?;raise 'private error' if e.message.include?('private');end
trace=JSON.parse(Net::HTTP.get(URI(base+'/trace')))
raise 'identity cache' unless trace.count{|r|r['path']=='/v1/auth/access'}==1
writes=trace.select{|r|r['method']=='PATCH'}
raise 'retry keys' unless writes.size==2&&writes[0]['key']==writes[1]['key']&&writes[0]['body']=={'email'=>nil}
puts 'Ruby approved interface passed'
