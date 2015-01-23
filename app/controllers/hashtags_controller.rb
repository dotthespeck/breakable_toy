class HashtagsController < ApplicationController

  def show
    @hashtag = Hashtag.find(params[:id])
    #@message = HashedMessage.where(params[:hashtag_id])
  end

end
