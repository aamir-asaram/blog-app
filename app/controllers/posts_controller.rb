class PostsController < ApplicationController
  def index
    @users = [User.find(params[:user_id])]
    @posts = @users[0].posts
  end

  def show
    @posts = [Post.find(params[:id])]
  end

  def new
    post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: post } }
    end
  end
end
