class SessionsController < ApplicationController
  before_filter :restrict_to_development, :only => [:test_login]

  skip_before_filter :set_current_user #don't check for the user when authenticating

  #login
  def create
    auth = request.env["omniauth.auth"]
    user = StudentUser.find_by_provider_and_uid(auth["provider"],auth["uid"]) || StudentUser.create_with_omniauth(auth)
    session[:user_id] = user.id
    redirect_to search_path #where go to when logged in
  end

  def landlordCreate
    auth = request.env["omniauth.auth"]
    user = StudentUser.find_by_provider_and_uid(auth["provider"],auth["uid"]) || StudentUser.create_with_omniauth(auth)
    redirect_to dashboard_path
  end

  #logout
  def destroy
    session.delete(:user_id)
    flash[:notice] = 'Logged out successfully.'
    redirect_to search_path #where to go to when logged out
  end

  #for testing -- DELETE THIS FOR PRODUCTION
  def test_login
    user = StudentUser.find(params[:user_id])
    session[:user_id] = user.id

    redirect_to search_path #where go to when logged in
  end

end