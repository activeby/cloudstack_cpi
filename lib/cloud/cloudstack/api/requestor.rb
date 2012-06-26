module Bosh::CloudStackCloud
  class Api::FogRequestor
    class << self
      def list request_name
        response = request "list_#{request_name}"
        parse_list response
      end


      private

      def request request_name
        set_connection
        @connection.send(request_name.to_sym)
      end

      def parse_list data
        # {"listvirtualmachinesresponse" => {"count" => "", "virtualmachine" => ""}

        data.values[0].values[1]
      end

      def set_connection
        @connection ||= Api.connection
      end
    end
  end
end