class App < Sinatra::Base
  use Rack::Authentication do |c|
    c.realm "Sample App"
    c.adapter Rack::Authentication::Adapters::Basic
  end

  get "/" do
    "OK"
  end
end
