ENV["BUNDLE_GEMFILE"] ||= File.expand_path("../../Gemfile", __FILE__)

require "rubygems"
require "bundler"
Bundler.setup(:default, :test)

require "rspec"
require 'ruby-debug'

require 'cloud'
require 'cloud/cloudstack'
require 'cloud/cloudstack/api'
require 'cloud/cloudstack/errors'

require 'fog'

class CloudStackSpecConfig
  attr_accessor :logger, :uuid
end

config = CloudStackSpecConfig.new
config.logger = Logger.new(STDOUT)
config.logger.level = Logger::ERROR

Bosh::Clouds::Config.configure(config)

RSpec.configure do |config|
  config.before(:each) do
   Fog.mock!
   Fog::Mock.reset
  end
end
def create_connection_to_cloudstack
  Bosh::CloudStackCloud::Api.authorize({cloudstack_host: 'test.host', cloudstack_api_key: 'test', cloudstack_secret_access_key: 'test'})
end