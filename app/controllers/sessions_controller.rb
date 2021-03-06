class SessionsController < ApplicationController
  
  
  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      sign_in @user
      redirect_back_or @user
    else
      #notice: "Please sign in."
      #flash.now[:error] = 'Invalid email/password combination' 
      redirect_to root_url, notice: "Invalid email/password combination."
    end
  end
  
  def destroy
     sign_out
    redirect_to root_url
  end
  
end
