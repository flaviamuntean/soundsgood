class PhotosController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    @photo = Photo.new(photo_params)
    @photo.user = current_user
    if @photo.save
      redirect_to bio_user_path(current_user), notice: "Bravo"
    else
      redirect_to bio_user_path(current_user), alert: "something went wrong"
    end
  end

  def destroy

  end

  private

  def photo_params
    params.require(:photo).permit(:url, :user_id)
  end
end
