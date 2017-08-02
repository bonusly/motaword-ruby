require 'motaword/exceptions/response_error'

module Motaword
  module Exceptions
    class BadRequest < ResponseError
      def self.code
        400
      end
    end
  end
end
