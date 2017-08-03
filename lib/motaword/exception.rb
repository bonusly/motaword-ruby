require 'motaword/exceptions/bad_request'
require 'motaword/exceptions/invalid_credentials'

module Motaword
  class Exception
    def self.all
      [*self.response_errors]
    end

    def self.response_errors
      [Exceptions::BadRequest, Exceptions::InvalidCredentials]
    end
  end
end
