class MessagesController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]

  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
  end

  def create
    @user = User.find(current_user.id)
    @message = @user.messages.build(message_params)

    if @message.save
      redirect_to conversations_path, notice: "Message saved successfully"
    else
      render :new
    end
  end

  private

  def message_params
  params.require(:message).permit(:post)
  end

end
