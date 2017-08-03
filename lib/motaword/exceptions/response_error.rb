module Motaword
  module Exceptions
    class ResponseError < StandardError
      attr_reader :response

      def self.response_exception?(response)
        return unless defined? code

        response_code(response) == self.code
      end

      def self.response_code(response)
        return response.fetch('httpCode', nil) if response.is_a? Hash
        return response.code if response.is_a? HTTParty::Response
        nil
      end

      def initialize(response)
        @response = response
      end
    end
  end
end
