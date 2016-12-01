class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :namespace
  before_action :get_header_musical_instruments

  def after_sign_in_path_for resource
    get_root_path
  end

  def verify_admin
    unless current_user.admin?
      flash[:danger] = t "devise.not_authorize_admin"
      redirect_to root_path
    end
  end

  def verify_user
    unless current_user.user?
      flash[:danger] = t "devise.not_authorize_admin"
      redirect_to admin_root_path
    end
  end

  def value post
    value = post.average("quality")
    value = value.avg if value
    value ||= 0
    value
  end

  private
  def namespace
    @namespace = self.class.parent.to_s.downcase
  end

  def get_root_path
    if current_user.admin?
      admin_root_path
    else
      root_path
    end
  end

  def get_header_musical_instruments
    @header_musical_instruments = MusicalInstrument.all
  end
end
