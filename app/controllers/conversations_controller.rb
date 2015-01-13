class ConversationsController < ApplicationController

  def index
    @conversations = Conversation.all
  end

  def new
    @conversation = Conversation.new
  end

  def create
    @conversation = Conversation.create(conversation_params)

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
