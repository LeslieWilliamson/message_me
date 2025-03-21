require "test_helper"

class MessageTest < ActiveSupport::TestCase
  test "Message is valid" do
    message = messages(:message1)
    assert message.valid?
  end
end
