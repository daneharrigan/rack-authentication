module Rack::Authentication::Adapters
  class Base
    attr :type, :credentials, :env

    def initialize(args={})
      @type = args[:type]
      @env  = args[:env]
      @credentials = args[:credentials]
    end
  end

  def good?
    false
  end

  def authorized?
    false
  end
end
