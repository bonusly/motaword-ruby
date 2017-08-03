require 'motaword/request'

module Motaword
  class AccessToken
    attr_reader :token, :expires_at, :scope

    def self.create(app_id, app_secret)
      response = Request.post('token', body: body, basic_auth: basic_auth(app_id, app_secret))
      new(response)
    end

    def self.body
      { 'grant_type' => 'client_credentials' }
    end

    def self.basic_auth(app_id, app_secret)
      { username: app_id, password: app_secret }
    end

    private

    def initialize(response)
      @token      = response['access_token']
      @expires_at = expires_at(response['expires_in'])
      @scope      = response['scope']
    end

    def expires_at(expires_in)
      Time.now + expires_in.to_i
    end
  end
end


