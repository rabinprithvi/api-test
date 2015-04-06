require 'rails_helper'
require 'vcr'

VCR.configure do |c|
  #the directory where your cassettes will be saved
  c.cassette_library_dir = Rails.root.join('spec', 'vcr_cassettes')
  # your HTTP request service. You can also use fakeweb, webmock, and more
  c.hook_into :webmock
  c.default_cassette_options = { record: :new_episodes }
  c.configure_rspec_metadata!
  c.allow_http_connections_when_no_cassette = true
  c.debug_logger = $stderr
end
