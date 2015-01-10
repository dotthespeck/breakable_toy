class ConversationsController < ApplicationController

before_action :authenticate_user!, only: [:destroy, :delete, :new, :create, :edit, :update]

  def index
    @conversations = Conversation.all.limit(20)
  end

  def new
    @conversation = Conversation.new
  end

  def create
    @conversation = Conversation.new(conversation_params)
    @conversation.user_id = current_user.id
      if @conversation.save
        redirect_to root_path, notice: "Post successfully created"
      else
        render :new
      end
  end

  private
  def conversation_params
    params.require(:conversation).permit(:post, :user_id)
  end
end
