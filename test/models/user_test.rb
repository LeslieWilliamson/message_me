require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "user is valid" do
    user = User.new(username: "testUser", password: "1Password!")
    assert user.valid?, "#{user.password} #{user.errors.full_messages}"
  end

  test "username required" do
    user = User.new(username: "", password: "1Password!")
    assert_not user.valid?
  end

  test "username minimum 6 characters" do
    user = User.new(username: "a" * 5, password: "1Password!")
    assert_not user.valid?
  end

  test "username maximum 20 characters" do
    user = User.new(username: "a" * 21, password: "1Password!")
    assert_not user.valid?
  end

  test "username unique" do
    user = User.new(username: users(:user1).username, password: "1Password!")
    assert_not user.valid?
  end

  test "password required" do
    user = User.new(username: users(:user1).username, password: "")
    assert_not user.valid?
  end

  test "password minimum 8 characters" do
    user = User.new(username: users(:user1).username, password: "a" * 7)
    assert_not user.valid?
  end
  test "password contains one lower case letter" do
    user = User.new(username: users(:user1).username, password: "1PASSWORD!")
    assert_not user.valid?
  end

  test "password contains one uppercase letter" do
    user = User.new(username: users(:user1).username, password: "1password!")
    assert_not user.valid?
  end

  test "password contains one digit" do
    user = User.new(username: users(:user1).username, password: "aPassword!")
    assert_not user.valid?
  end
  
  test "password contains one symbol character" do
    user = User.new(username: users(:user1).username, password: "1Password")
    assert_not user.valid?
  end

  test "password maximum 72 characters" do
    user = User.new(username: users(:user1).username, password: "1Pwd" * 19 )
    assert_not user.valid?
  end
end
