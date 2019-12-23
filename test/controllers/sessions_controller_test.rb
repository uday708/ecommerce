require 'test_helper'

class SessionsControllerTest < ActionController::TestCase

  def test_create_user
    post :create, params: {email: "testuser@gmail.com", password_digest: "digest"}
    assert_equal User.last.authenticity_token, json_response["token"]
  end
end
