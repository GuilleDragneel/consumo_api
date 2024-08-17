require 'spec_helper'
require 'webmock/rspec'
require_relative '../property_fetcher'

# Pruebas para la clase PropertyFetcher.
RSpec.describe PropertyFetcher do
  describe '.fetch_titles' do
    it 'fetches and returns titles from the API' do
      stub_request(:get, "https://api.stagingeb.com/v1/properties")
        .with(
          headers: {
            'Accept' => 'application/json',
            'X-Authorization' => 'l7u502p8v46ba3ppgvj5y2aad50lb9'
          }
        )
        .to_return(
          status: 200,
          body: JSON.generate({ properties: [{ title: 'Property 1' }, { title: 'Property 2' }] }),
          headers: { 'Content-Type' => 'application/json' }
        )

      titles = PropertyFetcher.fetch_titles

      puts "Fetched titles: #{titles}"

      expect(titles).to eq(['Property 1', 'Property 2'])
    end
  end
end
