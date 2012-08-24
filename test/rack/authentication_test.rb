require "test_helper"

class Rack::AuthenticationTest < MiniTest::Unit::TestCase
  include Rack::Test::Methods

  def test_bad_request
    header "Authorization", "Fail Token"
    get "/"

    assert_equal 400, last_response.status
  end

  def test_unauthorized
    authorize "bad-user", "bad-password"
    get "/"

    assert_equal 401, last_response.status
  end

  def test_good_request
    authorize "user", "secret"
    get "/"

    assert_equal 200,  last_response.status
    assert_equal "OK", last_response.body
  end

  def app
    App.new
  end
end
