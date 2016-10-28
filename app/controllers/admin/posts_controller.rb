class Admin::PostsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :destroy]
  before_action :verify_admin, only: [:show, :destroy]

  before_action :load_post, only: [:show, :destroy]
  before_action :load_comment, only: :show

  def destroy
    @musical_instrument = @post.musical_instrument
    @post.destroy
    flash[:success] = t "admin.flash.destroy_success", source: t("user.post.name")
    redirect_to admin_musical_instrument_path(@musical_instrument)
  end

  private
  def load_post
    @post = Post.find_by_id params[:id]
    if @post.nil?
      flash[:danger] = t "admin.flash.not_found", source: t("user.post.name")
      redirect_to posts_path
    end
  end

  def load_comment
    @comments = @post.comments
    @comment = @post.comments.new
  end
end
