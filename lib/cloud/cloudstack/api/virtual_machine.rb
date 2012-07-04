module Bosh::CloudStackCloud::Api
  class VirtualMachine < Base
    def self.all
      result = request(:list_virtual_machines)
      result.map{|data| new data}
    end
    def self.get id
      self.all.find{|vm| vm.id == id}
    end
    def self.deploy params
      data = request(:deploy_virtual_machine, params)
      new data
    end

    def destroy!
      request :destroy_virtual_machine, 'id' => self.id
    end

    def reboot!
      request :reboot_virtual_machine, 'id' => self.id
    end

    def attach_volume volume
      params = volume_params volume
      request :attach_volume, params
    end

    def detach_volume volume
      params = volume_params volume
      request :detach_volume, params
    end

    private
    def volume_params volume
      raise(IncorrectParameters,
       'expected that argument should be an instance of a Volume class') unless volume.class == Volume
      params = {
        'virtualmachineid' => self.id,
        'id' => volume.id
      }
    end
  end
end