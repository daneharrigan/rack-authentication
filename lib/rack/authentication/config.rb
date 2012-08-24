class Rack::Authentication::Config
	def realm(str=nil)
		@realm ||= str
	end

	def adapter(obj=nil)
		@adapter ||= obj
	end
end
