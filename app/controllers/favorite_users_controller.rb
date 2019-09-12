class FavoriteUsersController < ApplicationController
    before_action :set_user
  
    def create
      @favorite = Favorite.create(favorited: @user, user: current_user)
      notification = Notification.create(notifiable_type: "favorite", notifiable: @favorite, recipient: @user, user: current_user, action: "started")
      # NotificationRelayJob.perform_later(notification)
      respond_to do |format|
        format.html { redirect_to user_path(@user) }
        format.js
      end
    end
  
    def destroy
      Favorite.where(favorited_id: @user.id, user_id: current_user.id).first.destroy
      # Notification.where(recipient: @user).destroy
    end
  
    private
  
    def set_user
      @user = User.find(params[:user_id])
    end

  end