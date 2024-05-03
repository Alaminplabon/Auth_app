class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      user.update(last_login_at: Time.now) # Update last login time
      redirect_to dashboard_path, notice: "Logged in successfully!"
    else
      flash.now[:alert] = "Invalid email or password"
      render :new
    end
  end
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
