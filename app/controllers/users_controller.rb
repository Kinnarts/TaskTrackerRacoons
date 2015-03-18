class UsersController < ApplicationController
  before_action :authorize_admin, only: :create

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
  end

  private

  def user_params
    params.require(:user). permit(:email, :password, :password_confirmation)
  end
end
