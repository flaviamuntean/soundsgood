class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :user

  validates_presence_of :body, :conversation, :user

  def message_time
    created_at.strftime("%a %-d %bt %Y, %-l:%M%P")
  end
end