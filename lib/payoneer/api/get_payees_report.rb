module Payoneer
  module Api
    # Payoneer::Api::GetPayeesReport.request(start_date: '2015/09/01', end_date: '2015/10/2')
    module GetPayeesReport
      include Payoneer::Api::Core
      def self.to_api_params(report_type: nil, start_date: nil, end_date: nil)
        {
          p4: report_type,
          p5: start_date,
          p6: end_date
        }
      end
    end
  end
end
