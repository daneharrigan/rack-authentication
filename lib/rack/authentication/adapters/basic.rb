module Rack::Authentication::Adapters
  class Basic < Base
    def good?
      "Basic" == type
    end

    def authorized?
      username, password = credentials
      return false if username.nil? || password.nil?
      ENV["#{username.upcase}_PASSWORD"] == password
    end
  end
end
