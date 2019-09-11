class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :favorited, polymorphic: true


  def notification_to_s
    "favorites you"
  end

end
