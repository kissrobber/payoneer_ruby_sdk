module Payoneer
  module Api
    # Payoneer::Api::GetSinglePayeeReport.request(payee_id: 1000011)
    module GetSinglePayeeReport
      include Payoneer::Api::Core
      def self.to_api_params(payee_id: nil)
        { p4: payee_id }
      end
    end
  end
end
