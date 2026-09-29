require "affinity"
require "socket"
require "json"
server = TCPServer.new("127.0.0.1", 0)
requests = []
thread = Thread.new do
  2.times do |index|
    socket = server.accept
    first = socket.gets
    headers = {}
    while (line = socket.gets) && line != "\r\n"
      key, value = line.split(":", 2)
      headers[key.downcase] = value.strip
    end
    body = socket.read(headers.fetch("content-length", "0").to_i)
    requests << [first, headers, body]
    response = index == 0 ? '{"object":"list","data":[],"hasMore":false,"url":"/v1/orders"}' : '{"title":"Synthetic failure","status":422,"detail":"Invalid request"}'
    status = index == 0 ? "200 OK" : "422 Unprocessable Entity"
    socket.write "HTTP/1.1 #{status}\r\nContent-Type: application/json\r\nContent-Length: #{response.bytesize}\r\nConnection: close\r\n\r\n#{response}"
    socket.close
  end
end
client = Affinity::GeneratedClient.new(api_key: "synthetic-key", base_url: "http://127.0.0.1:#{server.addr[1]}", max_retries: 0)
options = {}
page = client.orders.list(limit: 2, starting_after: "ord_cursor", request_options: options)
raise "response" unless page.data.empty? && page.has_more == false
begin
  client.orders.create(idempotency_key: "stable-synthetic-key", practice_id: "prac_synthetic", patient_id: "pat_synthetic", prescriptions: [], request_options: options)
  raise "expected API error"
rescue Affinity::Errors::ApiError
end
raise "server hung" unless thread.join(10)
raise "query" unless requests[0][0].include?("limit=2") && requests[0][0].include?("startingAfter=ord_cursor")
requests.each do |_, headers, _|
  raise "auth" unless headers["x-affinity-api-key"] == "synthetic-key"
  raise "version" unless headers["affinity-version"] == "2026-09-28"
end
raise "idempotency" unless requests[1][1]["idempotency-key"] == "stable-synthetic-key"
raise "body" unless JSON.parse(requests[1][2])["practiceId"] == "prac_synthetic"
server.close
puts "Ruby transport and decoding checks passed"
