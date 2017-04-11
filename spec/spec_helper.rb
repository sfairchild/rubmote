require 'bundler/setup'
require 'webmock/rspec'
require 'rubmote'

RSpec.configure do |config|
	# Disable network requests while testing
	# all requests should be stubed with a return value
	WebMock.disable_net_connect!

  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
