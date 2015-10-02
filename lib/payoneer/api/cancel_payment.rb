module Payoneer
  module Api
    # Payoneer::Api::CancelPayment.request(payment_id: 1)
    module CancelPayment
      include Payoneer::Api::Core
      def self.to_api_params(payment_id: nil)
        {
          p4: payment_id
        }
      end
    end
  end
end
