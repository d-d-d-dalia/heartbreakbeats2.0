class SongVibe < ApplicationRecord

	belongs_to :song
  	belongs_to :vibe

  	validates :level, inclusion: {in: 1..5}
  	validates :level, numericality: {only_integer: true}

end