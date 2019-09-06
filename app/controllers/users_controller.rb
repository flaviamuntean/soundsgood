class UsersController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_user, except: :index
  def index
    if params[:query].present?
      if current_user
        @users = User.global_search(params[:query]).where.not(id: current_user.id)
      else
        @users = User.global_search(params[:query])
      end
    else
      if current_user
        @users = User.where.not(id: current_user.id)
      else
        @users = User.all
      end
      # use the one below to get only the users near you
      # @users = current_user.nearbys
    end

    if params[:latitude].present? && params[:longitude].present?
      current_user.latitude = params[:latitude]
      current_user.longitude = params[:longitude]
    end
  end

  def update_instrument
    current_user.instruments = []
    instrument_ids = params[:user][:instrument_ids][1..-1]
    instrument_ids.each do |id|
      current_user.instruments << Instrument.find(id)
    end
    if current_user.save
      redirect_to session[:current_path], notice: 'Your profile was successfully updated.'
    else
      render :bio
    end
    session[:current_path] = nil
  end

  def update_genre
    current_user.genres = []
    genre_ids = params[:user][:genre_ids][1..-1]
    genre_ids.each do |id|
      current_user.genres << Genre.find(id)
    end
    if current_user.save
      redirect_to session[:current_path], notice: 'Your profile was successfully updated.'
    else
      render :bio
    end
    session[:current_path] = nil
  end

  def show
    @video = Video.new
    @videos = Video.where(user_id: params[:id]).order(created_at: :DESC)
    session[:selected_profile_bar] = "video"
  end

  def audio
    session[:current_path] = audio_user_path(params[:id])
    @ids = @user.soundcloud_profile_load
    session[:selected_profile_bar] = "audio"
  end

  def bio
    session[:current_path] = bio_user_path(params[:id])
    @current_user = current_user

    @photo = Photo.new
    @photos = Photo.where(user_id: params[:id]).order(created_at: :DESC)
    session[:selected_profile_bar] = "bio"
  end

  def update
    if @user.update(user_params)
      redirect_to session[:current_path], notice: 'Your profile was successfully updated.'
    end
    session[:current_path] = nil
  end

  def influences
    @current_user = current_user
    session[:selected_profile_bar] = "influences"
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
    params.require(:user).permit(:bio, :soundcloud_profile)
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
