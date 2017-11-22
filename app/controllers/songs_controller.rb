class SongsController < ApplicationController

	def index
    	@songs = Song.all
 	end

  def new
   		@song = Song.new
      @vibes = Vibe.all
  end

  def create
   		# @song = Song.new(song_params)
  end

  def show
  		@song = Song.find(params[:id])
  end

  private

  	def song_params
      params.require(:song).permit(:name, :artist, :song_vibes)
    end

end