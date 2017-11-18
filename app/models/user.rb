class User < ApplicationRecord

	has_many :songs, through: :associations
  	has_many :associations

  	has_secure_password
  	validates :password, presence: true

end