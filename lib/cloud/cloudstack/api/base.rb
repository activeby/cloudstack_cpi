module Bosh::CloudStackCloud::Api
  class Base
    def initialize data
      @data = data
    end
    
    def [] key
      @data[key.to_s]
    end

    def method_missing(method_name, *args, &block) 
      @data[method_name.to_s]
    end

  end
end