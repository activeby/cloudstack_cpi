module Bosh::CloudStackCloud::Api
  class Base
    def initialize data
      @data = data
    end
    
    def [] key
      @data[key.to_s] || @data[key.to_sym]
    end

    private

    def method_missing(method_name, *args, &block)
      @data[method_name] || @data[method_name.to_sym]
    end

  end
end