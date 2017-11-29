class Song < ApplicationRecord

	has_many :song_vibes
  	has_many :vibes, through: :song_vibes

  	belongs_to :user

  	validates :name, :artist, :song_vibes, presence: true

  	accepts_nested_attributes_for :song_vibes, reject_if: proc { |attributes| attributes['level'].blank? }
  	
end