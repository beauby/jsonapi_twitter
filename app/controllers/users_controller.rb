class UsersController < ApplicationController
  def index
    users = User.all
    render jsonapi: users
  end

  def show
    user = User.find(params[:id])
    render jsonapi: user
  end
end
