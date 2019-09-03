require 'open-uri'
class AudiosController < ApplicationController

  def create
  end

  def destroy
  end

private

  def fecth_user
    @user = User.find(params[:user_id])
  end
end
