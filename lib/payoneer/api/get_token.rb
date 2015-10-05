module Payoneer
  module Api
    # Payoneer::Api::GetToken.request(payee_id: 1000011)
    module GetToken
      include Payoneer::Api::Core
      def self.to_api_params(payee_id: nil, approved: true)
        {
          p4: payee_id,
          p9: approved,
          p10: true
        }
      end
    end
  end
end
