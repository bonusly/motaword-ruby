module Motaword
  class Client
    def initialize(options = {})
      app_id     = options[:app_id]     || ENV['MOTAWORD_APP_ID']
      app_secret = options[:app_secret] || ENV['MOTAWORD_APP_SECRET']

      @access_token = AccessToken.create(app_id, app_secret)
    end

    private

    attr_reader :access_token
  end
end
