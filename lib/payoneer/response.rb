module Payoneer
  class Response < OpenStruct
    OK_STATUS_CODE = '000'

    def initialize(name, hash)
      super(convert_hash_keys(hash))
      self.response_name = name
    end

    def convert_hash_keys(value)
      case value
        when Array
          value.map { |v| convert_hash_keys(v) }
        when Hash
          Hash[value.map { |k, v| [k.underscore, convert_hash_keys(v)] }]
        else
          value
       end
    end

    def ok?
      if self.response_name == 'GetPaymentStatus'
        self.result == OK_STATUS_CODE
      else
        self.status == OK_STATUS_CODE
      end
    end
  end
end
