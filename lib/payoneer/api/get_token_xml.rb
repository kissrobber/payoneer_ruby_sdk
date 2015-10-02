module Payoneer
  module Api
    # Payoneer::Api::GetTokenXml.request(xml: data)
    module GetTokenXml
      include Payoneer::Api::Core
      def self.to_api_params(xml: nil)
        { xml: xml }
      end
      def self.to_response(response)
        response
      end
    end
  end
end
