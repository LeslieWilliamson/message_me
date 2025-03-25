require "test_helper"

class MessagesControllerTest < ActionDispatch::IntegrationTest
  test "must be signed in to create a message" do
    post message_url
    assert_response :redirect
    follow_redirect!
    assert_equal login_path, path
  end

  test "create message when signed in" do
    sign_in_as(users(:user2))
    assert_difference "Message.count", 1 do
      post message_path, params: { message: { body: "a test message" } }
    end
  end
end
