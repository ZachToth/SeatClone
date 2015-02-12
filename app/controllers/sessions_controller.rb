class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if 
      user && user.authenticase(params[:password])
      session[:user_id] = user.id
      redirect_to restaurants_path, :notice => "You have succesfully logged in."
      else
      flash.now[:alert] = "Invalid Email or Password"
      render :new 
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to restaurants_path, :notice => "You have successfully logged out."
  end

end
