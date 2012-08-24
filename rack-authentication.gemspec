# -*- encoding: utf-8 -*-
require File.expand_path('../lib/rack/authentication/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Dane Harrigan"]
  gem.email         = ["dane.harrigan@gmail.com"]
  gem.description   = %q{A modular implementation of Rack Auth}
  gem.summary       = %q{A modular implementation of Rack Auth}
  gem.homepage      = "https://github.com/daneharrigan/rack-authentication"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "rack-authentication"
  gem.require_paths = ["lib"]
  gem.version       = Rack::Authentication::VERSION
end
