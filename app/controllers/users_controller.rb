class UsersController < ApplicationController
  respond_to :html

  def new
    @user = User.new
  end

  def create
    @user = sign_up(user_params)
    sign_in(@user)
    respond_with @user, location: root_path
  end
  
  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end

