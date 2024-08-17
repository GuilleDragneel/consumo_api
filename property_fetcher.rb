require 'net/http'
require 'json'

class PropertyFetcher
  API_URL = 'https://api.stagingeb.com/v1/properties'.freeze
  API_KEY = 'l7u502p8v46ba3ppgvj5y2aad50lb9'.freeze

  def self.fetch_titles
    uri = URI(API_URL)
    request = Net::HTTP::Get.new(uri)
    request['Accept'] = 'application/json'
    request['X-Authorization'] = API_KEY

    response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == 'https') do |http|
      http.request(request)
    end

    data = JSON.parse(response.body)
    data['properties'].map { |property| property['title'] }
  end
end