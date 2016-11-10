class Admin::CommentsController < ApplicationController
  before_action :load_comment, only: :destroy

  def destroy
    @post = @comment.post
    @comment.destroy
    flash[:success] = t "admin.flash.destroy_success", source: "comment"
    redirect_to admin_post_path(@post)
  end

  private
  def load_comment
    @comment = Comment.find_by_id params[:id]
    if @comment.nil?
      flash[:danger] = t "admin.flash.not_found", source: "comment"
      redirect_to admin_root_path
    end
  end
end
