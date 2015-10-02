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
      attr_accessor :partner_username, :partner_api_password, :partner_id, :program_id, :env

      def initialize(options)
        options.each do |key, value|
          send("#{key}=", value)
        end
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
    end
  end
end
