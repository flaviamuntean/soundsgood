class Instrument < ApplicationRecord
  has_many :user_instruments, dependent: :destroy
  include PgSearch::Model
  multisearchable against: [:name]
end
