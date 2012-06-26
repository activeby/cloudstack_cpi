module Bosh::CloudStackCloud::Api
  class VirtualMachine < Base
    def self.all
      Requestor.request :list_virtual_machines
    end
    def self.get id
      Requestor.request(:list_virtual_machines).find{|params| params['id']==id}
    end
  end
end