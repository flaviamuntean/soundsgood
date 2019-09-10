class UsersController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_user, except: :index
  def index
    if params[:query].present?
      if current_user
        set_distance_from_user
        @users = User.global_search(params[:query]).where.not(id: current_user.id).order("distance_from_user ASC")
      else
        @users = User.global_search(params[:query])
      end
    else
      if current_user
        set_distance_from_user
        @users = User.where.not(id: current_user.id).order("distance_from_user ASC")
      else
        @users = User.all
      end
    end

    if params[:latitude].present? && params[:longitude].present?
      current_user.latitude = params[:latitude]
      current_user.longitude = params[:longitude]
      set_distance_from_user
    end
  end

  def update_instrument
    current_user.instruments = []
    instrument_ids = params[:user][:instrument_ids][1..-1]
    instrument_ids.each do |id|
      current_user.instruments << Instrument.find(id)
    end
  end

  def update_profile
    update_instrument
    update_genre
    if current_user.update(user_params) && current_user.save
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

  end

  def show
    @video = Video.new
    @videos = Video.where(user_id: params[:id]).order(created_at: :DESC)
    session[:selected_profile_bar] = "video"
  end

  def audio
    session[:current_path] = audio_user_path(params[:id])
    @songs = @user.soundcloud_profile_load
    session[:selected_profile_bar] = "audio"
  end

  def update_audio

  end

  def bio
    session[:current_path] = bio_user_path(params[:id])
    @current_user = current_user

    @photo = Photo.new
    @photos = Photo.where(user_id: params[:id]).order(created_at: :DESC)
    session[:selected_profile_bar] = "bio"
  end

  def update
    if params.dig(:user,:song_uid)
      @selected_songs = params.dig(:user,:song_uid).drop(1)
    else
      @selected_songs = []
    end
    @user.song_uid = @selected_songs
    @user.soundcloud_profile = params.dig(:user, :soundcloud_profile) || @user.soundcloud_profile
    if @user.save
      redirect_to session[:current_path], notice: 'Your profile was successfully updated.'
    end
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

  def unlink_spotify
    current_user.store = nil
    current_user.top_artists = nil
    current_user.top_tracks = nil
    if current_user.save
      redirect_to edit_user_registration_path(current_user), notice: 'Your Spotify account was unlinked.'
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:bio, :soundcloud_profile, :store, :distance_from_user, :song_uid)
  end

  def set_distance_from_user
    User.all.each do |user|
      user.distance_from_user = current_user.distance_to(user.address).round(1)
      user.save
    end
  end

  def fetch_spotify_details
    info = JSON.parse(@user.store)
    @spotify_user = RSpotify::User.new(info)
    # @top_artists = @spotify_user.top_artists(time_range: 'long_term') #=> (Artist array)
    # @top_tracks = @spotify_user.top_tracks(time_range: 'long_term') #=> (Track array)
    @top_artists = @user.top_artists
    @top_tracks = @user.top_tracks
    @track = @spotify_user.recently_played[0]
  end

  def find_soundsgood_playlist
    info = JSON.parse(current_user.store)
    current_spotify_user = RSpotify::User.new(info)
    playlists = current_spotify_user.playlists

    if playlists.any?
      current_spotify_user.playlists(limit: 50).each do |pl|
        if pl.name == "soundsgood"
          return playlist = pl
        else
          return playlist = current_spotify_user.create_playlist!('soundsgood')
        end
      end
    else
      return playlist = current_spotify_user.create_playlist!('soundsgood')
    end
  end
end
