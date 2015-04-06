require 'rails_helper'
require 'vcr'

describe Repo do
  describe 'get_repo_details'do
    it 'gets ideas2it details' do
      VCR.use_cassette("api_response") do
        response = (Net::HTTP.get_response(URI('https://api.github.com/orgs/ideas2it/repos')))
        result = JSON.parse(response.body)
        expect(result.first['name']).to match 'insoshi'
      end
    end
  end
end
