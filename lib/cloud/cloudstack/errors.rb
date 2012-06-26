module Bosh::CloudStackCloud

  class Error < StandardError; end

  class FatalError < Error; end

  class ConfigError < Error; end
  class ConnectionError < Error; end

  # class InstanceError < Error; end
  # class InstanceNotFound < Error; code(404); end
end
