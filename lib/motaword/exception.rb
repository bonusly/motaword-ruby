require 'motaword/exceptions/bad_request'

module Motaword
  class Exception
    def self.all
      [Exceptions::BadRequest]
    end
  end
end
