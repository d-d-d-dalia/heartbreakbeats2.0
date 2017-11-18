class Song < ApplicationRecord

	has_many :associations
  	has_many :users, through: :associations

  	validates :name, :artist, presence: true

end
