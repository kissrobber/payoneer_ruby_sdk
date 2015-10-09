module Payoneer
  module Api
    # Payoneer::Api::GetToken.request(payee_id: 1000011)
    module GetToken
      include Payoneer::Api::Core
      def self.to_api_params(payee_id: nil, approved: true, payout_methods: nil, redirect_url: nil, redirect_time: nil)
        {
          p4: payee_id,
          p9: approved,
          p10: true
        }.tap do |params|
          params[:p11] = payout_methods unless payout_methods.nil?
          params[:p6] = redirect_url unless redirect_url.nil?
          params[:p8] = redirect_time unless redirect_time.nil?
        end
      end
    end
  end
end
