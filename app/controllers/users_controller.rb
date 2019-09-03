class UsersController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_user, except: :index
  def index
    @users = User.all
  end

  def show
    @video = Video.new
    @videos = Video.where(user_id: params[:id]).order(created_at: :DESC)
  end

  def audio
    @ids = @user.soundcloud_profile_load
  end

  def bio
    @bio = @user.bio
  end

  def influences
    fetch_spotify_details if @user.spotify_config
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def fetch_spotify_details
    @spotify_user = RSpotify::User.new(eval(@user.spotify_config))
    @top_artists = @spotify_user.top_artists(time_range: 'long_term') #=> (Artist array)
    @top_tracks = @spotify_user.top_tracks(time_range: 'long_term') #=> (Track array)
  end
end
