class FavoriteUsersController < ApplicationController
    before_action :set_user
  
    def create
      Favorite.create(favorited: @user, user: current_user)
    end
  
    def destroy
      Favorite.where(favorited_id: @user.id, user_id: current_user.id).first.destroy
    end
  
    private
  
    def set_user
      @user = User.find(params[:user_id])
    end

  end