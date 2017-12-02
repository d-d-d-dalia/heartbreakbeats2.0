class User < ApplicationRecord

	has_many :songs, dependent: :destroy
  	
  	has_secure_password

  	validates :password, presence: true

  REGEX_VALID_EMAIL = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  
  validates :email, :username, :password, presence: true
  validates :email, uniqueness: {case_sensitive: false}
  validates :email, format: {with: REGEX_VALID_EMAIL}
  validates :password, length: {minimum: 6}

end