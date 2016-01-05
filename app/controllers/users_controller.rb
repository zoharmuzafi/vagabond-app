class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
   @user = User.new(user_params)
   if @user.save
     session[:user_id] = @user.id
     redirect_to user_path(current_user)
   else
     redirect_to signup_path
   end
 end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

private

 def user_params
   params.require(:user).permit(:name, :username, :email, :password, :password_confirmation, :city_id, :avatar)
 end
end
