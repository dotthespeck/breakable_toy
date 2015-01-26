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

    def edit
      @message = Message.find(params[:id])
    end

    def update
      @message = Message.find(params[:id])
      @message.update(message_params)

      if @message.update_attributes(message_params)
        redirect_to conversations_path, notice: "Announcement successfully updated"
      else
        render :edit, notice: "Announcement did not update"
      end
    end

    def destroy
      @message = Message.find(params[:id])

      if @message.destroy
        redirect_to conversations_path, notice: "Announcement successfully deleted"
      else
        render :edit, notice: "Announcement is not deleted"
      end
    end

    private
    def message_params
      params.require(:message).permit(:post, :announcement)
    end

  end
end
