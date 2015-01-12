class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.create(message_params)

    if @message.save
      redirect_to rooms_path, notice: "Message saved successfully"
    else
      render :new
    end
  end

  private

  def message_params
  params.require(:message).permit(:post)
  end

end
