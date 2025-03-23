class User < ApplicationRecord
  has_secure_password
  has_many :messages

  # PASSWORD_REQUIREMENTS=/\A
  #   (?=.{8,})     # minimum of 8 characters
  #   (?=.*\d)      # contain at least one digit
  #   (?=.*[a-z])   # contain at least one lower case letter
  #   (?=.*[A-Z])   # contain at least one upper case letter
  #   (?=.*[[:^alnum:]])  # contain at least one symbol
  # \z/x

  # PASSWORD_REQUIREMENTS=/(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[[:^alnum:]])/
  validates :password, format: PASSWORD_REQUIREMENTS
  validates :username, presence: true, uniqueness: true, length: { in: 6..20 }
end
