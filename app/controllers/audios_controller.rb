# class AudiosController < ApplicationController
#   skip_before_action :authenticate_user!

#   def create
#     @audio = Audio.new(audio_params)
#     @audio.user = current_user
#     if @audio.save
#       redirect_to audio_user_path(current_user), notice: "Bravo"
#     else
#       redirect_to audio_user_path(current_user), alert: "something went wrong"
#     end
#   end

#   def destroy
#   end

# private

#   def fecth_user
#     @user = User.find(params[:user_id])
#   end

#   def audio_params
#     params.require(:audio).permit(:uid, :user_id)
#   end
# end
