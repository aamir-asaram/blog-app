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

  def create
    post = Post.new(params.require(:post).permit(:title, :text)
    post.author = current_user
    if post.save
      flash[:success] = "Post created successfully"
      redirect_to user_path(id: current_user.id)
    else
      flash.now[:error] = "Post failed to save"
      render :new, locals: { post: post }
    end
  end
end
