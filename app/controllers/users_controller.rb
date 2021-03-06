class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
      if @user.save
        redirect_to restaurants_path, notice: "You have signed up!"
      else
        render :new
      end

  end

  def destroy
  end

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
