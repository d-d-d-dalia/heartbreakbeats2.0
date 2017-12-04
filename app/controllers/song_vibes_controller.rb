class SongVibesController < ApplicationController

def most_severe_vibes
	@user = current_user
	@most_severe_vibes = SongVibe.highest_level(current_user.id)
end

end