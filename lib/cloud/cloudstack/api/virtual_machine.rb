module Bosh::CloudStackCloud::Api
  class VirtualMachine < Base
    def self.all
      FogRequestor.list :virtual_machines
    end
    def self.get id
      self.all.find{|params| params['id'] == id}
    end
    def self.deploy options
      data = FogRequestor.request(:deploy_virtual_machine, options)
      new data
    end
  end
end