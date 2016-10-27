class CommentsController < ApplicationController
  def create
    @comment = Comment.new comment_params
    @comment.save
    @post = Post.find_by_id params[:comment][:target_id]
    redirect_to @post
  end

  private
  def comment_params
    params.require(:comment).permit :content, :user_id, :type, :target_id, :target_type
  end
end
