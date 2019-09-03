class UserInstrumentsController < ApplicationController
    has_many :users 
    has_many :instruments
    skip_before_action :authenticate_user!
end