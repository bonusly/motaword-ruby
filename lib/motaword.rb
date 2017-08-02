require 'motaword/access_token'
require 'motaword/config/authors'
require 'motaword/config/version'
require 'motaword/request'
require 'pry'

module Motaword
  LIVE_API    = 'https://api.motaword.com/'
  SANDBOX_API = 'https://sandbox.motaword.com/'

  class << self
    def api_base(sandbox = false)
      return LIVE_API unless sandbox
      SANDBOX_API
    end
  end
end
