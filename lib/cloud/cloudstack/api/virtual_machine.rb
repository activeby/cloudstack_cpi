module Bosh::CloudStackCloud::Api
  class VirtualMachine < Base
    def self.all
      result = FogRequestor.list(:virtual_machines)
      result.map{|data| new data}
    end
    def self.get id
      self.all.find{|vm| vm.id == id}
    end
    def self.deploy params
      data = request(:deploy_virtual_machine, params)
      new data
    end

    def attach_volume volume
      raise(IncorrectParameters,
       'expected that argument should be an instance of a Volume class') unless volume.class == Volume
      params = {
        'virtualmachineid' => self.id,
        'id' => volume.id
      }
      request :attach_volume, params
    end
  end
end