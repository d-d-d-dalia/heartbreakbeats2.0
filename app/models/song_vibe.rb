class SongVibe < ApplicationRecord

    belongs_to :song
  	belongs_to :vibe

  	validates :level, inclusion: {in: 1..5}
  	validates :level, numericality: {only_integer: true}

  def vibe_attributes=(vibe_selections)
    vibe_selections.each do |key, value|
      if value != "" && Vibe.find_by(name: value)
        self.vibe_id = Vibe.find_by(name: value).id
      else
        self.vibe = Vibe.create(name: value)
      end
    end
  end

end