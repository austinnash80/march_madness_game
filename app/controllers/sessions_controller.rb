class SessionsController < ApplicationController
def new
end

def create
  user = User.find_by_email(params[:email].downcase)
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect_to root_url, notice: "Logged in!"
  else
    flash.now.alert = "Email or password is invalid"
      redirect_to new_session_path(iv:'y')
  end
end

def destroy
  session[:user_id] = nil
  redirect_to root_url, notice: "Logged out!"
end
end
