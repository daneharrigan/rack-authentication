require "bundler/setup"
require "minitest/autorun"
require "rack/test"
require "sinatra/base"
require "rack/authentication"
require "rack/authentication/adapters/basic"

require_relative "support/app"

ENV["USER_PASSWORD"] = "secret"
