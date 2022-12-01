class UsersController < ApplicationController
  before_action :auth_user, only: [:index]
  def index
    @users = User.all
  end
  

  def new
    @user = User.new
  end

  def create
    # 需要有一个 user 的 key
    @user = User.new params.require(:user).permit(:username, :password)
    if @user.save
      flash[:notice] = '注册成功'
      redirect_to new_session_path
    else
      render action: :new
    end
  end

  private
  def auth_user
    unless session[:user_id]
      flash[:notice] = '请登录'
      redirect_to new_session_path
    end
  end
end
