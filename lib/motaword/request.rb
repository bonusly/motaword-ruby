require 'httparty'
require 'motaword/exception'


module Motaword
  class Request
    def self.get(*args)
      new.send :get, *args
    end

    def self.post(*args)
      new.send :post, *args
    end

    private

    def send(method, endpoint)
      url      = "#{Motaword.api_base}#{endpoint}"
      response = HTTParty.send(method, url, basic_auth: basic_auth)

      check_errors    response
      parsed_response response
    end

    def check_errors(response)
      Motaword::Exception.all.each do |e|
        raise e, response if e.response_exception?(response)
      end
    end

    def parsed_response(response)
      JSON.parse(response.body)
    end
  end
end
