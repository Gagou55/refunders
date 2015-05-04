class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @announces = current_user.announces
    @purchases = current_user.purchases
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to root_path
  end

  def edit
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :picture, :address)
  end

end
