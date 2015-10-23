module Payoneer
  module Api
    module Core
      def self.included(base)
        base.extend(ClassMethods)
      end
      module ClassMethods
        def get_method_name
          self.name.split('::').last
        end
        def to_api_params(params)
          params
        end
        def to_response(response)
          hash_response = Hash.from_xml(response.body)
          content_name = hash_response.keys.first
          inner_content = hash_response.values.first
          ::Payoneer::Response.new content_name, inner_content
        end

        def request(params = {})
          params = to_api_params(params)
          method_name = get_method_name
          config.validate!

          request_params = default_params.merge(mname: method_name).merge(params)

          request = Request.new(config)
          response = request.execute(request_params)

          fail Errors::ApiError.new(response.code, response.body) unless response.code == 200

          to_response(response)
        end

        class Request
          attr_accessor :max_attempts, :num_attempts, :config
          def initialize(config)
            self.config = config
            self.max_attempts = config.proxy.size
            self.num_attempts = 0
          end
          def execute(request_params)
            self.num_attempts += 1
            config.setup_proxy_if_set
            RestClient.post(config.api_url, request_params)
          rescue RestClient::RequestTimeout => e
            # if Net::OpenTimeout === e.original_exception &&
            if self.max_attempts > self.num_attempts
              config.rotate_proxy
              retry
            end
            raise e
          end
        end

        def config
          ::Payoneer.config
        end

        def default_params
          {
            p1: config.partner_username,
            p2: config.partner_api_password,
            p3: config.partner_id,
          }
        end
      end
    end
  end
end
