class VideosController < ApplicationController
  def create
    @video = Video.new(video_params)
    @video.user = current_user
    if @video.save
      redirect_to user_path(current_user), notice: 'Video was successfully added.'
    else
      @user = current_user
      @videos = Video.where(user_id: params[:user_id]).order(created_at: :DESC)
      @id = params[:user_id]
      render 'users/show', user_id: @id
    end
  end

  def destroy
    @video = Video.find(params[:id])
    @id = params[:user_id]
    if @video.destroy
      redirect_to user_path(current_user), notice: 'Video was successfully deleted.'
    else
      render 'users/show', id: @id
    end
  end

  private

  def video_params
    params.require(:video).permit(:url, :uid, :user_id)
  end
end
