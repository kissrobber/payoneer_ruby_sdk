module Payoneer
  module Api
    # Payoneer::Api::GetToken.request(payee_id: 1000011)
    module GetToken
      include Payoneer::Api::Core
      def self.to_api_params(payee_id: nil, approved: true, payout_methods: nil)
        params = {
          p4: payee_id,
          p9: approved,
          p10: true
        }
        params[:p11] = payout_methods unless payout_methods.nil?
        params
      end
    end
  end
end
