class UsersController < ApplicationController
  def show
    @user = User.find(params["id"])
    @articles = @user.articles
    @profile = true if current_user == @user
  end

end
