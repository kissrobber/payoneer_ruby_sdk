require 'erb'
require 'yaml'

module Payoneer
  module Configuration
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def config
        @@config
      rescue
        raise ::Payoneer::Errors::ConfigurationError.new
      end

      def configure(options)
        @@config = ::Payoneer::Config.new(options)
      end
    end

    class Config
      SANDBOX_API_URL = 'https://api.sandbox.payoneer.com/Payouts/HttpApi/API.aspx'
      PRODUCTION_API_URL = 'https://api.payoneer.com/Payouts/HttpApi/API.aspx'
      attr_accessor :partner_username, :partner_api_password, :partner_id, :program_id, :env, :proxy, :proxy_index

      def initialize(options)
        options.each do |key, value|
          send("#{key}=", value)
        end
        self.normalize_proxies
      end

      def normalize_proxies
        self.proxy = self.proxy ? Array(proxy) : []
        self.proxy_index = 0
      end

      def validate!
        raise ConfigurationError.new unless %w(partner_username partner_api_password partner_id program_id env).all?{|k| self.send(k).present? }
      end

      def production?
        self.env == 'production'
      end

      def api_url
        production? ? PRODUCTION_API_URL : SANDBOX_API_URL
      end

      def setup_proxy_if_set
        return if self.proxy.size == 0
        # TODO New in 2.0: Specify a per-request proxy https://github.com/rest-client/rest-client#proxy
        RestClient.proxy = self.proxy[self.proxy_index]
      end

      def rotate_proxy
        self.proxy_index = (self.proxy_index + 1) % self.proxy.size
      end

    end
  end
end
