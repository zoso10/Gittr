require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start

require 'bundler/setup'

Bundler.setup

require 'vcr'
require 'gittr'

RSpec.configure do |config|
  config.order = 'random'
end

VCR.configure do |config|
  config.cassette_library_dir = 'spec/vcr'
  config.hook_into :webmock
end
