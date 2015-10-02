module Payoneer
  module Api
    # Payoneer::Api::GetPayeeDetails.request(payee_id: 1000011)
    module GetPayeeDetails
      include Payoneer::Api::Core
      def self.to_api_params(payee_id: nil)
        { p4: payee_id }
      end
    end
  end
end
