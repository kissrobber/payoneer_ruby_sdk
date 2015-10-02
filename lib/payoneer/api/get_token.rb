module Payoneer
  module Api
    # Payoneer::Api::GetToken.request(payee_id: 1000011)
    module GetToken
      include Payoneer::Api::Core
      def self.to_api_params(payee_id: nil)
        { p4: payee_id }
      end
      def self.to_response(response)
        response
      end
    end
  end
end
