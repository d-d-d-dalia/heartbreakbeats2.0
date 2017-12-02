class SongVibe < ApplicationRecord

    belongs_to :song
  	belongs_to :vibe

  	validates :level, inclusion: {in: 1..5}
  	validates :level, numericality: {only_integer: true}

  	def vibe_attributes=(vibe_selections)
  		vibe_selections.each do |key, value|
       
          if value != "" && !self.vibe
             # binding.pry
  			     self.vibe = Vibe.find_or_create_by(name: value)
          elsif value != ""
              self.vibe.update(name: value)
          end
      	end
  	end

end