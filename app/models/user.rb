class User < ApplicationRecord

	has_many :songs, dependent: :destroy
  	
  	has_secure_password

  	REGEX_VALID_EMAIL = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  
  	validates :email, :username, :password, presence: true
  	validates :email, uniqueness: {case_sensitive: false}
 	validates :email, format: {with: REGEX_VALID_EMAIL}
  	validates :password, length: {minimum: 6}

  def self.find_or_create_by_omniauth(auth_hash)

    @user = where(email: auth_hash[:info][:email]).first_or_create do |user|
      user.username = auth_hash[:info][:name]
      user.email = auth_hash[:info][:email]
      user.password = SecureRandom.hex
    end
    binding.pry
  end

end