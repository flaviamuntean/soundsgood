class Genre < ApplicationRecord
  has_many :user_genres, dependent: :destroy
  include PgSearch::Model
  multisearchable against: [:name]
end
