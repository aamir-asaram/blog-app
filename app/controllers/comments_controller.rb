class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(params.require(:comment).permit(:text))
    @comment.author = current_user
    @comment.post = Post.find(params[:post_id])
    if @comment.save
      redirect_to user_post_path(@comment.post.author, @comment.post)
    else
      render :new
    end
  end

  def destroy
    @comment = Comment.find(params[:comment_id])
    @comment.destroy
    redirect_to user_posts_path(current_user)
  end
end
