module Bosh::CloudStackCloud::Api
  class VirtualMachine < Base
    def self.all
      FogRequestor.list :virtual_machines
    end
    def self.get id
      self.all.find{|params| params['id'] == id}
    end
    def self.deploy options
      FogRequestor.deploy_virtual_machine options
      
    end
  end
end