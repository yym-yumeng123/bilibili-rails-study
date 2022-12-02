class SessionsController < ApplicationController
  # session rails 内置的能够访问的方法, 把 session 数据存储在 cookie 中

  def create
    @user = User.find_by(username: params[:username], password: params[:password])
    p '----------------'
    p @user
    if @user
      signin_user @user
      # flash[:notice] = '登录成功'
      # redirect_to root_path
      render json: { resouces: @user}
    else
      flash[:notice] = '用户名或密码不正确'
      render action: :new
    end
  end

  def new
  end

  def destroy
    logout
    flash[:notice] = '退出成功'
    redirect_to root_path
  end
end
