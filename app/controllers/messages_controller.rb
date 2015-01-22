class MessagesController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]

  def new
    @conversation = Conversation.find(params[:conversation_id])
    @message = Message.new
  end

  def create
    @conversation = Conversation.find(params[:conversation_id])
    @message = @conversation.messages.build(special_params)
    @message.user_id = current_user.id
    @check_hashtag = @message.tag_strings
    @new_hashtag = @message.get_hashtag

    if @message.save
      unless @new_hashtag == nil
        HashedPost.create(hashtag_keyword_id: @new_hashtag.id, message_id: @message.id)
      end
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

  #private

  def message_params
    params.require(:message).permit(:post, :message_id, :conversation_id, :user_id, :hashtag_keyword_id)
  end

  def special_params
    new_params = {}
    if params[:message_id]
      new_params[:post] = params[:post]
      new_params[:conversation_id] = params[:conversation_id]
      new_params[:parent_id] = params[:message_id]
    else
      new_params[:post] = params[:post]
      new_params[:conversation_id] = params[:conversation_id]
    end
    new_params
  end

end
