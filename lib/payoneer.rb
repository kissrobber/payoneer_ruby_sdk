require "payoneer/version"
require 'rest-client'
require 'active_support'
require 'active_support/core_ext'

require 'payoneer/configuration'
require 'payoneer/response'
require 'payoneer/errors'
require 'payoneer/api'

module Payoneer
  include ::Payoneer::Configuration
end
