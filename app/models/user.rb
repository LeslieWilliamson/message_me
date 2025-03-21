class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true, length: { in: 6..20 }
  has_secure_password
  PASSWORD_REQUIREMENTS=/\A
    (?=.{8,}) # at least 8 characters long
  /x
  validates :password, format: PASSWORD_REQUIREMENTS

  has_many :messages
end
