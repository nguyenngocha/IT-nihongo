class Admin::DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :verify_admin, only: :home
end
