require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "the login path" do
    get login_url
    assert_response :success
  end
end
