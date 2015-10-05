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

          response = RestClient.post(config.api_url, request_params)

          fail Errors::ApiError.new(response.code, response.body) unless response.code == 200

          to_response(response)
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
