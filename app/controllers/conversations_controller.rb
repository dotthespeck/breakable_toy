class ConversationsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]

  def index
    @conversations = Conversation.all
  end

  def new
    @conversation = Conversation.new
  end

  def create
    @user = User.find(current_user.id)
    @conversation = @user.conversations.create(conversation_params)

    if @conversation.save
      redirect_to conversations_path, notice: "New conversation created"
    else
      render :new
    end
  end

  private

  def conversation_params
    params.require(:conversation).permit(:title)
  end

end
