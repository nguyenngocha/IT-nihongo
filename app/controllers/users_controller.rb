class UsersController < ApplicationController
  before_action :load_user, only: :show

  private
  def load_user
    @user = User.find_by_id params[:id]
    if @user.nil?
      flash[:danger] = t "admin.flash.not_found", source: "User"
      redirect_to root_path
    end
  end
end
