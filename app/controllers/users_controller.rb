class UsersController < ApplicationController
  def index
    @users = User.where('id !=?', 0).page params[:page]
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    if current_user
      @user = current_user
    else
      redirect_to :login, notice: '请先登录'
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      render 'edit', notice: '保存成功'
    else
      render 'edit', notice: '保存失败'
    end
  end

  def signup
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.nick_name = @user.name
    @user.save
    redirect_to login_path, notice: '注册成功，请登录'
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
      redirect_to :root, notice: '登录成功'
    else
      redirect_to :login, notice: '账号/密码错误'
    end
  end

  def logout
    cookies.delete(:auth_token)
    redirect_to :root
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  private
    def user_params
      params.require(:user).permit!
    end
end
