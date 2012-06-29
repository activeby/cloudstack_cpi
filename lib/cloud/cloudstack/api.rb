require "cloud/cloudstack/api/errors"
require "cloud/cloudstack/api/base"
require "cloud/cloudstack/api/requestor"
require "cloud/cloudstack/api/virtual_machine"
require "cloud/cloudstack/api/volume"
module Bosh::CloudStackCloud::Api
  require 'fog'

  # autoload :User, 'active-api/resources/user'

  def self.authorize params
    @connection = Fog::Compute::Cloudstack.new(params)
  end

  def self.connection
    @connection || raise(Bosh::CloudStackCloud::ConnectionError, 'Connection to CloudStack is not established.')
  end

  def self.break_connection
    @connection = nil
  end
  # def self.logger= logger
  #   @logger = logger
  # end

  # def self.logger
  #   @logger ||= Logger.new STDOUT
  # end
end