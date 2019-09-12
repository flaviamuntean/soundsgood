class MessagesController < ApplicationController
  before_action do
    @conversation = Conversation.find(params[:conversation_id])
  end

  def index
    @messages = @conversation.messages
    # if @messages.length > 10
    #   @over_ten = true
    #   @messages = @messages[-10..-1]
    # end
    # if params[:m]
    #   @over_ten = false
    #   @messages = @conversation.messages
    # end
    if @messages.last
      if @messages.last.user_id != current_user.id
        @messages.last.read = true
      end
    end
    @message = @conversation.messages.new
  end

  def new
    @message = @conversation.messages.new
  end

  def create
    @message = @conversation.messages.new(message_params)    
    if @message.save
      user = @message.conversation.recipient
      user = @message.conversation.sender if current_user == user
      notification = Notification.create(notifiable_type: "favorite", recipient: user, user: current_user, action: "messaged", notifiable: @message)
      respond_to do |format|
        format.html { redirect_to conversation_messages_path(@conversation) }
        format.js
      end

    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :user_id)
  end
end
