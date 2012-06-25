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
   Bosh::CloudStackCloud::Api.break_connection
  end
end