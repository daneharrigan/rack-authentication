require "base64"

class Rack::Authentication::Request
	def initialize(env, config)
		@env     = env
		@adapter = config.adapter.new({
			type: type,
			credentials: credentials,
			env: @env
		})
	end

	def authorized?
		@adapter.authorized?
	end

	def good?
		@adapter.good?
	end

	def type
		@type ||= params[0].to_s
	end

	private

	def credentials
		return [] if params.empty?
		@credentials ||= if "Basic" == type
			Base64.decode64(params[1]).split(":")
		else
			params[1].split(":")
		end
	end

	def params
		@params ||= @env[authorization_key].to_s.split(" ")
	end

	def authorization_key
		keys = ['HTTP_AUTHORIZATION', 'X-HTTP_AUTHORIZATION', 'X_HTTP_AUTHORIZATION']
		@authorization_key ||= keys.detect { |key| @env.has_key?(key) }
	end
end
