require 'bundler/setup'

Bundler.setup

require 'vcr'
require 'gittr'

RSpec.configure do |config|
  config.order = 'random'
end
