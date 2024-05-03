class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_session_path, notice: "User was successfully created. Please log in."
    else
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to dashboard_path, notice: "User deleted successfully."
  end
  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name)
  end
end
