module Bosh::CloudStackCloud::Api
  class Volume < Base
    def self.create params
      response = request(:create_volume, params)
      new response
    end

    def self.all
      result = request(:list_volumes)
      result.map{|data| new data}
    end

    def self.get id
      self.all.find{|volume| volume.id == id}
    end

    def delete!
      request :delete_volume, {'id' => self.id}
    end
  end
end
