class MessagesController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]

  def index
    @messages = Message.all
  end

  def new
    @conversation = Conversation.find(params[:conversation_id])
    @message = Message.new
  end

  def create
    @conversation = Conversation.find(params[:conversation_id])
    @message = @conversation.messages.build(message_params)
    @message.user_id = current_user.id

    if @message.save
      redirect_to conversations_path, notice: "Message saved successfully"
    else
      render :new
    end
  end

  private

  def message_params
  params.require(:message).permit(:post, :conversation_id, :user_id)
  end

end
