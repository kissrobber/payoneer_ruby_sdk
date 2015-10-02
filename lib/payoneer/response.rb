module Payoneer
  class Response < OpenStruct
    OK_STATUS_CODE = '000'

    def initialize(hash)
      super(convert_hash_keys(hash))
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
      self.status == OK_STATUS_CODE
    end
  end
end
