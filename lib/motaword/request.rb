require 'httparty'
require 'motaword/exception'
require 'motaword/disgusting_http_hack'

class FuckingLogger
  include HTTParty
  debug_output $stdout
end

module Motaword
  class Request
    include HTTParty

    debug_output $stdout
    attr_reader :successful, :error_message

    def self.get(*args)
      new.request :get, *args
    end

    def self.post(*args)
      new.request :post, *args
    end

    def request(method, endpoint, options)
      headers    = default_headers.merge(options[:headers])
      basic_auth = options[:basic_auth]
      url        = "#{Motaword.api_base}#{endpoint}"

      response = FuckingLogger.send(method,
                               url,
                               headers: { 'Content-Type' => 'application/json' },
                               basic_auth: basic_auth)

      check_errors    response
      parsed_response response
    rescue *Motaword::Exception.all => e
      log_error e
      raise e
    end

    private

    def initialize
      clear_error
    end

    def default_headers
      { 'Accept'       => 'application/json',
        'Content-Type' => 'application/json' }
    end

    def parsed_response(response)
      JSON.parse(response.body)
    end

    def check_errors(response)
      Motaword::Exception.all.each do |e|
        raise e, response if e.response_exception?(response)
      end
    end

    def clear_error
      @successful    = true
      @error_class   = nil
      @error_message = nil
    end

    def log_error(e)
      @successful    = false
      @error_class   = e.class
      @error_message = e.message
    end
  end
end
