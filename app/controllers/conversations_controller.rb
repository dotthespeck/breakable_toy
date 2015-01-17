class ConversationsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :update, :edit]

  def index
    @conversations = Conversation.all.order(created_at: :desc)
  end

  def show
    @conversation = Conversation.find(params[:id])
    @messages = Message.all.select {|m| m.parent_id == nil }
    @replies = Message.all.group([:conversation_id, :parent_id])
    binding.pry
  end
  #User.includes(:posts).where('posts.name = ?', 'example')

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

  def destroy
    @conversation = Conversation.find(params[:id])
    if @conversation.destroy
      redirect_to conversations_path, notice: "Conversation successfully deleted"
    else
      render :edit, notice: "Conversation is not deleted"
    end
  end

  private

  def conversation_params
    params.require(:conversation).permit(:title)
  end

end
