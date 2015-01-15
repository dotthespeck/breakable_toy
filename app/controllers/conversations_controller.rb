class ConversationsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]

  def index
    @conversations = Conversation.all.order(created_at: :desc)
  end

  def show
    @conversation = Conversation.find(params[:id])
    @messages = @conversation.messages.order(created_at: :desc)
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

  def edit
    @conversation = Conversation.find(params[:id])
  end

  def update
    @conversation = Conversation.find(params[:id])
    @conversation.update(conversation_params)

    if @conversation.update_attributes(conversation_params)
      redirect_to conversation_path(@conversation), notice: "Conversation updated"
    else
      render :edit, notice: "Conversation did not update"
    end
  end

  private

  def conversation_params
    params.require(:conversation).permit(:title)
  end

end
