class MessagesController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]

  def index
    @messages = Message.all.order(created_at: :asc)
  end

  def new
    @conversation = Conversation.find(params[:conversation_id])
    @message = Message.new
  end

  def create
    @conversation = Conversation.find(params[:conversation_id])
    @message = @conversation.messages.build(message_params)
    @message.user_id = current_user.id
    binding.pry

    if @message.save
      redirect_to conversation_path(@conversation), notice: "Message saved successfully"
    else
      render :new
    end
  end

  def edit
    @conversation = Conversation.find(params[:conversation_id])
    @message = Message.find(params[:id])
  end

  def update
    @message = Message.find(params[:id])
    @message.update(message_params)

    if @message.update_attributes(message_params)
      redirect_to conversation_path(params[:conversation_id]), notice: "Message updated"
    else
      render :edit, notice: "Message did not update"
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @conversation = @message.conversation

    if @message.destroy
      redirect_to conversation_path(params[:conversation_id]), notice: "Message successfully deleted"
    else
      render :edit, notice: "Message is not deleted"
    end
  end

  private

  def message_params
    params.require(:message).permit(:post, :id, :conversation_id, :user_id)
  end

end
