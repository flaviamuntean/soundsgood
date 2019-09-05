class Photo < ApplicationRecord
  belongs_to :user
  mount_uploader :url, PhotoUploader
end
