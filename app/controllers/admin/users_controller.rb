class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :verify_admin
  before_action :load_user, only: [:edit, :update, :destroy]

  def index
    @users = User.user
  end

  def new
    @user = User.new
    @user.build_profile
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t "admin.flash.add_success", source: t("admin.user.name")
      redirect_to admin_users_path
    else
      render :new
    end
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = t "admin.flash.edit_success", source: t("admin.user.name")
      redirect_to admin_users_path
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:success] = t "admin.flash.destroy_success", source: t("admin.user.name")
    redirect_to admin_users_path
  end

  private
  def user_params
    params.require(:user).permit :email,
      :name, :avatar, :password, :password_confirmation,
      profile_attributes: [:address, :old, :contact, :gender]
  end

  def load_user
    @user = User.find_by_id params[:id]
    if @user.nil?
      flash[:danger] = t "admin.flash.not_found", source: t("admin.user.name")
      redirect_to admin_users_path
    end
  end
end
