require 'motaword/request'

module Motaword
  class AccessToken
    # If you see this close your eyes, these shouldn't be public
    APP_ID     = '4a5800861f1bff02'
    APP_SECRET = 'c32008d7d6dbd09bd5ece5873aef5819'

    def self.create
      new.create
    end

    def create
      Request.post('token', body: body, basic_auth: basic_auth )
    end

    private

    def body
      { 'grant_type' => 'client_credentials' }
    end

    def basic_auth
      { username: APP_ID, password: APP_SECRET }
    end
  end
end


