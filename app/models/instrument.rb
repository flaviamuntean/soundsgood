class Instrument < ApplicationRecord
  has_many :user_instruments
  include PgSearch::Model
  multisearchable against: [:name]
end
