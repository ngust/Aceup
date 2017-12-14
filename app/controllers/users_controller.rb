class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id # auto log in
      redirect_to jobs_path, notice: "Welcome aboard, #{@user.firstName}!"
    else
      render :new
    end
  end

  protected

  def user_params
    params.require(:user).permit(:email, :firstName, :lastName, :password, :password_confirmation, :phoneNo, :role)
  end
end