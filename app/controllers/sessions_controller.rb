class SessionsController < ApplicationController
  # skip_before_filter :verify_authenticity_token, only: :create
  def create_with_facebook
    auth = request.env['omniauth.auth']
    @identity = Identity.find_with_omniauth(auth)
    @identity = Identity.create_with_omniauth(auth) if @identity.nil?
    if @identity.user == current_user && current_user != (false || nil)
      redirect_to root_url 
    end
         
    if current_user && current_user != @identity.user
      @user = current_user
      @user.update(name: auth['extra']['raw_info']['name'])
      @identity.user = @user
      @identity.save
      @user.save
      redirect_to root_url, notice: "Successfully linked that account!"
    end

    if @identity.user && !current_user
      @user = @identity.user
      @user.update(name: auth['extra']['raw_info']['name'])
      @user.save
      session[:user_id] = @identity.user.id
      redirect_to user_path(@user.id)
    end


    if !current_user && @identity.user == nil
      @user = User.create(name: auth['extra']['raw_info']['name'])
      @identity.user = @user
      @identity.save!
      session[:user_id] = @identity.user.id
      
      redirect_to user_path(@user.id)
    end
  end

  def create_with_twitter
    auth = request.env['omniauth.auth']
    p ">>>>>>>>>>>>>"
    p auth
    @identity = Identity.find_with_omniauth(auth)
    @identity = Identity.create_with_omniauth(auth) if @identity.nil?
    if @identity.user == current_user && current_user != (false || nil)
      redirect_to root_url 
    end
    if current_user && current_user != @identity.user
      @user = current_user
      p "???????????????"
      p auth['extra']['raw_info']['screen_name']
      @user.update(handle: auth['extra']['raw_info']['screen_name'])
      @identity.user = @user
      @identity.save
      @user.save
      redirect_to root_url, notice: "Successfully linked that account!"
    end

    if @identity.user && !current_user
       p "???????????????"
      p auth['extra']['raw_info']['screen_name']
      @user = @identity.user
      @user.update(handle: auth['extra']['raw_info']['screen_name'])
      @user.save
      session[:user_id] = @identity.user.id
      redirect_to user_path(@user.id)
    end

    if !current_user && @identity.user == nil
      @user = User.create(handle: auth['extra']['raw_info']['screen_name'])
      @identity.user = @user
      @identity.save!
      session[:user_id] = @identity.user.id
      
      redirect_to user_path(@user.id)
    end
  end

  def destroy
    session[:user_id] = nil
  redirect_to root_url, notice: "Signed out!"
  end
end
