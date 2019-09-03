class GenresController < ApplicationController
    belongs_to :user_genres
    skip_before_action :authenticate_user!
end