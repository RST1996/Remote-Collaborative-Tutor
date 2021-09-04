class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  def after_sign_in_path_for(resource)
    dashboard_path
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_path, :alert => exception.message
  end

  def after_sign_out_path_for(resource_or_scope)
    about_path
  end
end
