class SessionsController < ApplicationController
  # skip_before_filter :verify_authenticity_token, only: :create
  def create
    auth = request.env['omniauth.auth']
    p auth
    @identity = Identity.find_with_omniauth(auth)
    @identity = Identity.create_with_omniauth(auth) if @identity.nil?

    if signed_in?
      if @identity.user == current_user
        redirect_to root_url, notice: "Already linked that account!"
      else
        @identity.user = current_user
        @identity.save
        redirect_to root_url, notice: "Successfully linked that account!"
      end
    else
      if @identity.user.present?
        @user = @identity.user
        # this works for facebook but not twitter
        @user.update(name: auth['extra']['raw_info']['name'])
        @user.save
        session[:user_id] = @identity.user.id
        
        redirect_to root_url
      else
        p "&&&&&&&&&&&&&&&&&&&&&&&&&"
        @user = User.create(name: auth['name'])
        @identity.user = @user
        @identity.save
      session[:user_id] = @identity.user.id
        redirect_to root_url
      end
    end
  
  end
  def destroy
    session[:user_id] = nil
  redirect_to root_url, notice: "Signed out!"
  end
end
