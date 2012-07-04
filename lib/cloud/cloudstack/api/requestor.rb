module Bosh::CloudStackCloud
  class Api::FogRequestor
    class << self

      def request request_name, params = {}
        response = connection.send(request_name, params)
        extract_data_from_response response
      end

      private

      def extract_data_from_response response
        #{"request_nameresponse" => {}}
        response.values.last
      end

      def connection
        Api.connection
      end
    end
  end
end