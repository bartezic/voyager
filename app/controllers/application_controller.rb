class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource_or_scope)
    stored_location_for(resource_or_scope) || root_path
  end

  helper_method :current_team
  def current_team
    @current_team ||= current_user.teams.find(session[:current_team_id]) if session[:current_team_id]
    @current_team ||= current_user.teams.last
  end

  protected

  def configure_permitted_parameters
    added_attrs = [:first_name, :last_name, :username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: [:login, :password]
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def storable_location?
    !user_signed_in? &&
      request.get? &&
      is_navigational_format? &&
      !devise_controller? &&
      !request.xhr? &&
      !turbo_frame_request?
  end

  def store_user_location!
    store_location_for(:user, request.fullpath)
  end
end
