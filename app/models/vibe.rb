class Vibe < ApplicationRecord

	has_many :song_vibes
  	has_many :songs, :through => :song_vibes

  	validates_uniqueness_of :name, presence: true

end