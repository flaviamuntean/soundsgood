class InstrumentsController < ApplicationController
    belongs_to :user_instrument
    skip_before_action :authenticate_user!
end