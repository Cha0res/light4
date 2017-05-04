class AdminsController < ApplicationController
  def index
    if current_admin
      redirect_to :admin_main
    else
      redirect_to :admin_login
    end
  end

  def welcome
  end

  def login
  end

  def logout
    session[:admin_id] = nil
    redirect_to :admin_login
  end

  def create_login_session
    @admin = Admin.find_by_name(params[:name])
    if @admin && @admin.authenticate(params[:password])
      session[:admin_id] = @admin.id
      redirect_to :admin_main
    else
      redirect_to :admin_login, notice: '账号/密码错误'
    end
  end

  def main
  end

  def edit
    @admin = current_admin
  end

  def update
    @admin = current_admin

    if @admin.update(admin_params)

    else

    end

    redirect_to :admin_edit
  end

  private
    def admin_params
      params.require(:admin).permit!
    end
end
