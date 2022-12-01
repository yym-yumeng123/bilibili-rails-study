class Admin::UsersController < ApplicationController
  layout 'admin'
  def index
    @users = User.all
  end

  def search
    @users = User.all.where(["username like ?", "%#{params[:username]}%"])
    render action: :index
  end
end
