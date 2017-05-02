class UsersController < ApplicationController
  before_action :authenticate_user!, only: :show
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to @user
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :bio, :email, :password, :skills)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end
end