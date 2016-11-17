class CommentsController < ApplicationController
  before_action :load_comment, only: [:edit, :update, :destroy]

  def create
    @comment = Comment.new comment_params
    @comment.save
    if params[:comment][:target_id] == Post.name
      @post = Post.find_by_id params[:comment][:target_id]
    else
      @comment = Comment.find_by_id params[:comment][:target_id]
      @post = @comment.post
    end
    redirect_to @post
  end

  def edit
    @post = @comment.post
    @post ||= @comment.comment.post
    @child_comment = false
    @child_comment = true if @comment.comment
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    post = @comment.post
    post ||= @comment.comment.post
    if @comment.update_attributes comment_params
      flash[:success] = t "admin.flash.update_success", source: "comment"
      redirect_to post
    end
  end

  def destroy
    if @comment.user == current_user
      @post = @comment.post
      @comment.destroy
      flash[:success] = t "admin.flash.destroy_success", source: "comment"
      redirect_to @post
    end
  end

  private
  def comment_params
    params.require(:comment).permit :content, :user_id, :type, :target_id, :target_type
  end

  def load_comment
    @comment = Comment.find_by_id params[:id]
    if @comment.nil?
      flash[:danger] = t "admin.flash.not_found", source: t("user.comment.name")
      redirect_to root_path
    end
  end
end
