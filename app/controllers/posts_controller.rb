class PostsController < ApplicationController
  def index
    @users = [User.find(params[:user_id])]
    @posts = @users[0].posts.includes(:comments)
  end

  def show
    @posts = [Post.find(params[:id])]
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(params.require(:post).permit(:title, :text))
    if @post.save
      redirect_to user_posts_path(current_user)
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @post.destroy
    redirect_to user_posts_path(current_user)
  end
end
