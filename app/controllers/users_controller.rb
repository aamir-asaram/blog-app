class UsersController < ApplicationController
  def index
    @users = User.all

    render json: @users
  end

  def show
    @users = [User.find(params[:id])]
    @recent_posts = @users[0].recent_posts
  end
end
