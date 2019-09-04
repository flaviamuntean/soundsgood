module ApplicationHelper
  def photo_or_fallback(user)
    if user.avatar.present?
      user.avatar
    else
      asset_path('soundsgood.png')
    end
  end
end
