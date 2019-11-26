class Audio < ApplicationRecord
  belongs_to :user

  validates :user, presence: true
  validates :url, presence: true
  validates :uid, presence: true
end



#base url
#https://api.soundcloud.com/resolve.json?url=
#userprofile
#https://soundcloud.com/pietro-dallavecchia/tracks&
#client-id
#client_id=UW9ajvMgVdMMW3cdeBi8lPfN6dvOVGji



