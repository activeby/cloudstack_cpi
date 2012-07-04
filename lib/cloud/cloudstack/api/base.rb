module Bosh::CloudStackCloud::Api
  class Base
    def initialize data = {}
      @data = data
    end
    
    def [] key
      @data[key.to_s] || @data[key.to_sym]
    end


    def self.request name, options = {}
      new.request name, options
    end

    def request name, options
      FogRequestor.request(name, options)
    end
    private

    def method_missing(method_name, *args, &block)
      @data[method_name.to_s] || @data[method_name.to_sym]
    end

  end
end