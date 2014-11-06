class SessionsController < ApplicationController
  def new
  end
  #This method executes after the user enters their info and clicks log in
  def create
    if user_signed_in?
        session[:user_id] = user.id
        redirect_to user, notice: "Logged in!"
    else
        flash[:error] = "Wrong Username or Password."
        redirect_to root_url
    end
  end
  #logging out calls this method
  def destroy
  	session[:user_id] = nil
	sign_out current_user
    redirect_to root_url, notice: "Logged out."
  end
end
