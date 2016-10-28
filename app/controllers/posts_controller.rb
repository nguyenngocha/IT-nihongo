class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :verify_user, except: :show
  before_action :load_music_instrument, only: [:new, :edit]
  before_action :load_post, only: [:edit, :show, :update, :destroy]
  before_action :load_comment, only: :show

  def index
    @posts =  Post.all
  end

  def new
   @post = Post.new
  end

  def create
    @post = Post.new post_params
    if @post.save
      flash[:success] = t "admin.flash.add_success", source: t("user.post.name")
      redirect_to posts_path
    else
      load_music_instrument
      render :new
    end
  end

  def update
    if @post.update_attributes post_params
      flash[:success] = t "admin.flash.update_success", source: t("user.post.name")
      redirect_to posts_path
    else
      load_music_instrument
      render :edit
    end
  end

  def destroy
    @post.destroy
    flash[:success] = t "admin.flash.destroy_success", source: t("user.post.name")
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit :sound_quality, :felling, :accessories, :name,
      :user_id, :content, :musical_instrument_id, :image
  end

  def load_music_instrument
    @musical_instruments = MusicalInstrument.all
  end

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
