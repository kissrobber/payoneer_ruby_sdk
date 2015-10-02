module Payoneer
  module Api
    # Payoneer::Api::ChangePayeeId.request(old_payee_id: 1000002, new_payee_id: 2000002)
    module ChangePayeeId
      include Payoneer::Api::Core
      def self.to_api_params(old_payee_id: nil, new_payee_id: nil)
        {
          p4: old_payee_id,
          p5: new_payee_id
        }
      end
    end
  end
end
