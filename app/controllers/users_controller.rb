class UsersController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_user, except: :index
  def index
    if params[:query].present?
      @users = User.global_search(params[:query])
    else
      @users = User.all
      # use the one below to get only the users near you
      # @users = current_user.nearbys
    end
  end

  def show
    @video = Video.new
    @videos = Video.where(user_id: params[:id]).order(created_at: :DESC)
  end

  def audio
    @ids = @user.soundcloud_profile_load
  end

  def bio
    @current_user = current_user
  end

  def update
    if @user.update(user_params)
      redirect_to bio_user_path, notice: 'Bio was successfully updated.'
    end
  end

  def influences
    if @user.store
      fetch_spotify_details
    else
      session[:current_path] = influences_user_path(params[:id])
    end
  end

  def add_to_playlist
    playlist = find_soundsgood_playlist
    tracks = []
    tracks << RSpotify::Track.find(params[:track_id])
    if playlist.add_tracks!(tracks)
      redirect_to influences_user_path(@user), notice: "'#{tracks.first.name}' was successfully added to your Spotify 'soundsgood' playlist."
    else
      render :influences
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:bio)


  end

  def fetch_spotify_details
    info = JSON.parse(@user.store)
    @spotify_user = RSpotify::User.new(info)
    @top_artists = @spotify_user.top_artists(time_range: 'long_term') #=> (Artist array)
    @top_tracks = @spotify_user.top_tracks(time_range: 'long_term') #=> (Track array)
    @track = @spotify_user.recently_played[0]
  end

  def find_soundsgood_playlist
    info = JSON.parse(current_user.store)
    current_spotify_user = RSpotify::User.new(info)
    current_spotify_user.playlists(limit: 50).each do |pl|
      if pl.name == "soundsgood"
        return playlist = pl
      else
        return playlist = current_spotify_user.create_playlist!('soundsgood')
      end
    end
  end
end
