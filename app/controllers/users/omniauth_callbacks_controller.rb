class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def spotify
    @user = current_user
    credentials = request.env["omniauth.auth"]
    @user.spotify_config = credentials.to_hash
    if @user.save
      redirect_to edit_user_registration_path, event: :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, kind: "Spotify") if is_navigational_format?
    end
  end

  def failure
    redirect_to edit_user_registration_path
  end
end
