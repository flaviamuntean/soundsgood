class Video < ApplicationRecord
  belongs_to :user
  validates :user, presence: true
  validates :url, presence: true
  # users should not be allowed to upload the same video more than once
  validates_uniqueness_of :uid, scope: :user_id

  validates :uid, length: { is: 11 }

  YT_LINK_FORMAT = /\A.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/i
  validates :url, presence: true, format: YT_LINK_FORMAT

  before_validation do
    uid = url.match(YT_LINK_FORMAT)
    self.uid = uid[2] if uid && uid[2]
  end
end
