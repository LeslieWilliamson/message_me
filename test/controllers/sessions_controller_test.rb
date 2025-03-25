require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "the login path" do
    get login_url
    assert_response :success
  end

  test "loggin in" do
    sign_in_as(users(:user1))
    assert_response :redirect
    follow_redirect!
    assert_equal root_path, path
  end

  test "logging out" do
    sign_in_as(users(:user1))
    assert_response :redirect
    follow_redirect!
    assert_equal root_path, path

    sign_out
    assert_response :redirect
    follow_redirect!
    assert_equal login_path, path
  end
end
