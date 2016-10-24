class MessagesController < ApplicationController
  def index
    messages = Message.all
    render jsonapi: messages
  end

  def show
    message = Message.find(params[:id])
    render jsonapi: message
  end
end
