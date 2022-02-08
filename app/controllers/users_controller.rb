class UsersController < ApplicationController
  def show
    @user = current_user
    authorize @user
  end

  def edit
    @user = current_user
    authorize @user
  end

  def update
    @user = current_user
    @user.update(user_params)
    authorize @user
    redirect_to profile_path
  end

  private

  def user_params
    params.require("/profile").permit(:name, :address, :phone_number)
  end



end
