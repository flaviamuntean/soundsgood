class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :user

  validates_presence_of :body, :conversation, :user
  after_create :broadcast_message

  def message_time
    created_at.strftime("%a %-d %bt %Y, %-l:%M%P")
  end

  # def message_short_time
  #   created_at.strftime("%-l:%M%P")
  # end

  def broadcast_message
    ActionCable.server.broadcast("conversation_#{self.conversation.id}",
      { message_partial: ApplicationController.renderer.render(partial: "messages/message", locals: { message: self, user_is_messages_author: false }),
      current_user_id: user.id
    })
  end
end
