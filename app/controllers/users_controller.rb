class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user_params = require_params
    user_params.delete(:confirm_password)
    @user = User.new(user_params)
    respond_to do |format|
      if require_params[:password] == require_params[:confirm_password]
        if @user.save
          session[:user_id] = @user.id
          session[:username] = @user.username
          format.html { redirect_to '/' }
        else
          format.html { render :new }
        end
      else
        @user.errors.add(:password, "Doesn't match")
        format.html { render :new }
      end
    end
  end

  private

  def require_params
    params.require(:user).permit(
      :username, 
      :password, 
      :first_name, 
      :confirm_password,
      :last_name, 
      :gender, 
      :email, 
      :phone
    )
  end
end
