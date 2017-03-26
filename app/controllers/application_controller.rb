class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
    def current_admin
      @current_admin ||= session[:admin_id] && Admin.find(session[:admin_id])
    end

    def current_user
      @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
    end

    helper_method :current_admin
    helper_method :current_user
end
