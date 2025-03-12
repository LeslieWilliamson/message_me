require "test_helper"

class ChatroomControllerTest < ActionDispatch::IntegrationTest
  test "the root path" do
    get root_url
    assert_response :success
  end
end
