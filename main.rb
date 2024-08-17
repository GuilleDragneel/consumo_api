#En este documento se hace el consummo de la API
require 'uri'
require 'net/http'
require 'json'

url = URI("https://api.stagingeb.com/v1/properties")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true

request = Net::HTTP::Get.new(url)
request["accept"] = 'application/json'
request["X-Authorization"] = 'l7u502p8v46ba3ppgvj5y2aad50lb9'

response = http.request(request)
response_body = response.read_body
data = JSON.parse(response_body)

data["content"].each do |property|
  puts property["title"]
end

