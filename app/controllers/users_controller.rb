class UsersController < ApplicationController
  def signup
    @user =  User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to :root
  end

  def login
  end

  def create_login_session
    user = User.find_by_name(params[:name])
    if user && user.authenticate(params[:password])
      if params[:remember_me]
        cookies.permanent[:auth_token] = user.auth_token
      else
        cookies[:auth_token] = user.auth_token
      end
      redirect_to :root
    else
      redirect_to :login
    end
  end

  def logout
    cookies.delete(:auth_token)
    redirect_to :root
  end

  private
    def user_params
      params.require(:user).permit!
    end
end