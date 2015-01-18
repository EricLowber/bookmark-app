class UsersController < ApplicationController
  def new
    @user = User.new    
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
       UserMailer.welcome_email(@user).deliver_later
      redirect_to root_url, notice: "Thanks for signing up!"
    else 
      render "new"
    end
  end
  
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end  
end
