class Song < ApplicationRecord

	has_many :song_vibes
  	has_many :vibes, through: :song_vibes

  	belongs_to :user

  	validates :name, :artist, :song_vibes, presence: true

  	accepts_nested_attributes_for :song_vibes

  	def song_vibe_attributes(vibe_selections)
  		vibe_selections.each do |key, value|
  		
      	end
  	end

end