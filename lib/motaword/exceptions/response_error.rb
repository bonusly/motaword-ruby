module Motaword
  module Exceptions
    class ResponseError < StandardError
      attr_reader :response

      def self.response_exception?(response)
        return unless defined? code

        response.fetch('httpCode', nil) == self.code
      end

      def initialize(response)
        @response = response
      end
    end
  end
end
