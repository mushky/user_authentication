class User < ActiveRecord::Base
  has_secure_password

	EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates(:name, presence: true, length: { maximum: 50 })
	validates(:email, presence: true, format: { with: EMAIL_REGEX} )
end