class Vibe < ApplicationRecord

	has_many :song_vibes
  	has_many :songs, :through => :song_vibes

  	validates_uniqueness_of :name, presence: true


  	def self.highest_level
    	@most_severe_vibes = self.all.select do |v|
      		v.level == 5
    	end
    	@most_severe_vibes.map do |v|
      		v.song_vibe.song
    	end
  	end

end