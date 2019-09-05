module ApplicationHelper
  def photo_or_fallback(user)
    if user.avatar.present?
      user.avatar
    else
      asset_path('soundsgood.png')
    end
  end

  def banner_or_fallback(user)
    if user.banner.present?
      user.banner
    else
      asset_path('banner_default.png')
    end
  end
end
