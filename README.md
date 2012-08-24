# Rack::Authentication

A modular implementation of Rack::Auth

## Installation

Add this line to your application's Gemfile:

    gem 'rack-authentication'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rack-authentication

## Usage

    require "rack/authentication"
    require "rack/authentication/adapters/basic"

    class App < Sinatra::Base
      use Rack::Authentication do |config|
        config.realm "My App"
        config.adapter Rack::Authentication::Adapters::Basic
      end
    end

### Want to make your own custom authentication adapter?

Just inherit from `Rack::Authentication::Adapters::Base`. Three methods wil be defined
for you:

* `type` -  The type of authentication (eg: Basic, Bearer)
* `env` - The rack app's environment
* `credentials` - The username/password of the request. This will always be an array

You're required to define `good?` and `authorized?`.

    # my_adapter.rb
    class MyAdapter < Rack::Authentication::Adapters::Base
      def good?
        "Basic" == type
      end

      def authorized?
        User.exists?(username: credentials[0], password: credentials[1])
      end
    end

    # app.rb
    class App < Sinatra::Base
      use Rack::Authentication do |config|
        config.realm "My App"
        config.adapter MyAdapter
      end
    end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
