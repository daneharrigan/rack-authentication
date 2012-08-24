require "rack/authentication/version"
require "rack/authentication/request"
require "rack/authentication/config"
require "rack/authentication/adapters/base"

module Rack
  class Authentication
    def initialize(app)
      @app    = app
      @config = Config.new
      yield(@config)
    end

    def call(env)
      @env = env
      @req = Request.new(env, @config)

      return bad_request  unless @req.good?
      return unauthorized unless @req.authorized?

      @app.call(env)
    end

    private

    def unauthorized
      return [ 401,
        {
          "Content-Type"     => "text/plain",
          "Content-Length"   => "0",
          "WWW-Authenticate" => ('%s realm="%s"' % [@req.type, @config.realm])
        },
        []
      ]
    end

    def bad_request
      return [ 400,
        {
          "Content-Type"   => "text/plain",
          "Content-Length" => "0"
        },
        []
      ]
    end
  end
end
