module Admin
  class MessagesController < ApplicationController

    def new
      @message = Message.new
    end

    def create
      @user = User.find(current_user.id)
      @message = @user.messages.create(message_params)

      if @message.save
        redirect_to conversations_path, notice: "New announcement created"
      else
        render :new
      end
    end

    private
    def message_params
      params.require(:message).permit(:post, :announcement)
    end

  end
end
