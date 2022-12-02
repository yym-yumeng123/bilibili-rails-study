class ApplicationController < ActionController::Base
  helper_method :logged_in?
  helper_method :current_user

  # 提取登录相关
  def signin_user user
    session[:user_id] = user.id
  end

  def logout_user
    session[:user_id] = nil
  end

  def logged_in?
    !!session[:user_id]
  end

  def current_user
    if logged_in?
      @current_user ||= User.find(session[:user_id])
    else
      nil
    end
  end

  private
  def auth_user
    unless logged_in?
      flash[:notice] = '请登录'
      redirect_to new_session_path
    end
  end
end
