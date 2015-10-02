module Payoneer
  module Api
    # Payoneer::Api::PerformPayoutPayment.request(payment_id: 1, payee_id: 2000002, amount: 20, description: 'unkounkounko', currency: 'USD', payment_date: '2015/10/2')
    module PerformPayoutPayment
      include Payoneer::Api::Core
      def self.to_api_params(payment_id: nil, payee_id: nil, amount: nil, description: nil, payment_date: nil, currency: nil)
        {
          p4: config.program_id,
          p5: payment_id,
          p6: payee_id,
          p7: amount,
          p8: description,
          p9: payment_date,
          currency: currency
        }
      end
    end
  end
end
