module Bosh
  module CloudStackCloud; end
end

require "httpclient"
require "pp"
require "set"
require "tmpdir"
require "uuidtools"
require "yajl"

require "common/thread_pool"
require "common/thread_formatter"

require "cloud"


module Bosh
  module Clouds
    CloudStack = Bosh::CloudStackCloud::Cloud
  end
end
