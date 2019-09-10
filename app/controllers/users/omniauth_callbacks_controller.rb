class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # WITH JSON
  def spotify
    @user = current_user
    credentials = request.env["omniauth.auth"]
    @user.store = credentials.to_json
    spotify_user = RSpotify::User.new(JSON.parse(credentials.to_json))
    @user.top_tracks = spotify_user.top_tracks(time_range: 'long_term') #=> (Track array)
    @user.top_artists = spotify_user.top_artists(time_range: 'long_term') #=> (Artist array)
    if @user.save
      redirect_to influences_user_path(@user), event: :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, kind: "Spotify") if is_navigational_format?
      # session[:current_path] = nil
    end
  end

  def failure
    redirect_to edit_user_registration_path
  end

  def facebook
    user = User.find_for_facebook_oauth(request.env['omniauth.auth'])

    if user.persisted?
      sign_in_and_redirect user, event: :authentication
      set_flash_message(:notice, :success, kind: 'Facebook') if is_navigational_format?
    else
      session['devise.facebook_data'] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end
end
