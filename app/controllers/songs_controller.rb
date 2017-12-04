class SongsController < ApplicationController

	def index
    @songs = Song.all
 	end

  def new
   	@song = Song.new
    @vibes = Vibe.all
  end

  def create
   	@song = current_user.songs.build(song_params)
    if @song.save
      redirect_to user_path(current_user)
    else
      @vibes = Vibe.all
      flash[:error] = @song.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.find(params[:user_id])
  	@song = Song.find(params[:id])
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    if @song.update(song_params)
      redirect_to song_path(@song)
    else
      flash[:error] = @song.errors.full_messages
      render :edit
    end
  end

  def destroy
    Song.find(params[:id]).destroy
    redirect_to user_path(current_user)
  end

  private

  	def song_params
      params.require(:song).permit(:name, :artist, song_vibes_attributes: [:level, :song_id, :id, vibe_attributes: [:name]])
    end

end