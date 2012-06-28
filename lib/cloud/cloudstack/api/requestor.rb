module Bosh::CloudStackCloud
  class Api::FogRequestor
    class << self
      def list request_name
        response = request "list_#{request_name}"
        parse_list response
      end

      def request request_name, params = {}
        #{"request_nameresponse" => {}}
        set_connection
        response = @connection.send(request_name, params)
        response.values.first
      end

      private
      def parse_list data
        # {"count" => "", "virtualmachine" => ""}
        data.values[1]
      end

      def set_connection
        @connection ||= Api.connection
      end
    end
  end
end