module Payoneer
  module Api
    # Payoneer::Api::GetPaymentStatus.request(payee_id: 1000011, payment_id: 1)
    module GetPaymentStatus
      include Payoneer::Api::Core
      def self.to_api_params(payee_id: nil, payment_id: nil)
        {
          p4: payee_id,
          p5: payment_id
        }
      end
    end
  end
end
