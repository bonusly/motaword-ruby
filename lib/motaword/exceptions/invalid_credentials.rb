require 'motaword/exceptions/response_error'

module Motaword
  module Exceptions
    class InvalidCredentials < ResponseError
      def self.code
        401
      end
    end
  end
end
