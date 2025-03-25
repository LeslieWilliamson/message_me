require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "login" do
    get login_url
    assert_response :success

    sign_in_as(users(:user1))
    assert_response :redirect
    follow_redirect!
    assert_equal root_path, path
  end

  test "failed login" do
    sign_in_as(users(:user2), pwd: "wrong-pwd")
    assert_response :unprocessable_entity
    assert_equal login_path, path
  end

  test "logout" do
    sign_in_as(users(:user3))
    assert_response :redirect
    follow_redirect!
    assert_equal root_path, path

    sign_out
    assert_response :redirect
    follow_redirect!
    assert_equal login_path, path
  end

  test "login path unreachable when logged in" do
    sign_in_as(users(:user4))

    get login_url
    assert_response :redirect
    follow_redirect!
    assert_equal root_path, path
  end

  test "login not allowed when logged in" do
    sign_in_as(users(:user4))

    post login_url
    assert_response :redirect
    follow_redirect!
    assert_equal root_path, path
  end
end
