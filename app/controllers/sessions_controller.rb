class SessionsController < ApplicationController
  def new
  end

  def create
    #Determine if admin or student or moderator
    user = Admin.find_by_email(params[:email])

    
    if user
      if user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to :controller => 'home', :action => 'index'
      else
        flash[:notice] = 'Failed to Log In! Email or password is invalid'
        redirect_to login_path
      end
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path
  end
end