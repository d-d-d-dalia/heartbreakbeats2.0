class SongVibesController < ApplicationController

def most_severe_vibes
	@most_severe_vibes = SongVibe.highest_level
end

end
