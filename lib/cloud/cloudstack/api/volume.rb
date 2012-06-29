module Bosh::CloudStackCloud::Api
  class Volume < Base
    def self.create params
      response = FogRequestor.request(:create_volume, params)
      new response
    end
  end
end
