require "test_helper"

class ChatroomControllerTest < ActionDispatch::IntegrationTest
  test "the root path forbidden when not logged in" do
    get root_url
    assert_response :redirect
    follow_redirect!
    assert_equal login_path, path
  end

  test "the root path accessible when logged in" do
    sign_in_as(users(:user1))
    assert_response :redirect
    follow_redirect!
    assert_equal root_path, path
  end
end
