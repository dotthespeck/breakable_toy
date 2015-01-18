module Admin
  class MessagesController < ApplicationController
    def new
      @message = Message.new
    end
  end
end
