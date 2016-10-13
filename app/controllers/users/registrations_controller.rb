class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  def new
    build_resource {}
    self.resource.build_profile
    respond_with self.resource
  end
  
  def edit
    unless self.resource.profile
      self.resource.build_profile
      respond_with self.resource
    end
  end

  protected
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit :email,
      :name, :avatar, :password, :password_confirmation,
      profile_attributes: [:address, :old, :contact, :gender]}
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update) {|u| u.permit :email,
      :name, :avatar, :password, :password_confirmation, :current_password,
      profile_attributes: [:address, :old, :contact, :gender]}
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
