class SongVibe < ApplicationRecord

	belongs_to :song
  	belongs_to :vibe

  	validates :level, inclusion: {in: 1..5}
  	validates :level, numericality: {only_integer: true}


  	def vibe_attributes=(vibe_selections)
  		vibe_selections.each do |key, value|
  			vibe = Vibe.find_or_create_by(name: value)
  			self.vibe = vibe
      	end
  	end

end