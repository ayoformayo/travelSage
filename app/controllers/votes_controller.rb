class VotesController < ApplicationController
  def create
    @user = User.find(10)
    @vote = Vote.where(voteable_id: params['voteable_id'], voteable_type: params['voteable_type'], user_id: 10).first_or_create
    @vote.update(value: params["value"])
    @vote.save
    p @vote
    p "???????"
    p @user.votes.sum(:value)
    redirect_to root_path
  end

  def update
    p "Update"
    p params
  end

  def destroy

  end
end
