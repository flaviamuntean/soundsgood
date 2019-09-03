class UserGenresController < ApplicationController
    has_many :users 
    has_many :genres
    skip_before_action :authenticate_user!
end