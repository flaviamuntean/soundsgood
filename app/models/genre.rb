class Genre < ApplicationRecord
  has_many :user_genres
  include PgSearch::Model
  multisearchable against: [:name]
end
