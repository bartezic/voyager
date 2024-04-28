class Admin::BaseController < ApplicationController
  before_action :store_user_location!, if: :storable_location?
  before_action :authenticate_user!
  before_action :authenticate_admin!

  private

  def authenticate_admin!
    redirect_to root_path, alert: "You are not authorized to access this page." unless current_user.is_admin?
  end
end
