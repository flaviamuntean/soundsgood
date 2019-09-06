class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :soundcloud_profile, :spotify_config, :bio, :avatar, :banner, :birthday, :address])
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || home_path
  end

  def after_update_path_for(resource)
    user_path(resource)
  end

  # def after_sign_up_path_for(resource)
  #   user_path(resource)
  # end
end
