require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "username is valid" do
    user = User.new(username: "TestUser", password: "password")
    assert user.valid?
  end

  test "username required" do
    user = User.new(username: "", password: "password")
    assert_not user.valid?
  end

  test "username minimum 6 characters" do
    user = User.new(username: "a" * 5, password: "password")
    assert_not user.valid?
  end

  test "username maximum 20 characters" do
    user = User.new(username: "a" * 21, password: "password")
    assert_not user.valid?
  end

  test "username unique" do
    user = User.new(username: users(:testUser1).username, password: "password")
    assert_not user.valid?
  end

  test "password required" do
    user = User.new(username: users(:testUser1).username, password: "")
    assert_not user.valid?
  end

  test "password minimum 8 characters" do
    user = User.new(username: users(:testUser1).username, password: "a" * 7)
    assert_not user.valid?
  end

  test "password maximum 72 characters" do
    user = User.new(username: users(:testUser1).username, password: "a" * 73)
    assert_not user.valid?
  end
end
