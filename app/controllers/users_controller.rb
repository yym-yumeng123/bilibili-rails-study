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

  def blogs
    @blogs = current_user.blogs
  end


end
