module ApplicationHelper
  def photo_or_fallback(user)
    if user.avatar.present?
      user.avatar
    else
      asset_path('avatar.png')
    end
  end

  def banner_or_fallback(user)
    if user.banner.present?
      user.banner
    else
      asset_path('banner_default.png')
    end
  end

  def fetch_recipient(conversation)
    if conversation.sender_id == current_user.id || conversation.recipient_id == current_user.id
      if conversation.sender_id == current_user.id
        recipient = User.find(conversation.recipient_id)
      else
        recipient = User.find(conversation.sender_id)
      end
    end
    return recipient
  end
end
