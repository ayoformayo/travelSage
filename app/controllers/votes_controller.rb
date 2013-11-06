class VotesController < ApplicationController
  def create
    @user = User.find(10)
    @vote = Vote.where(voteable_id: params['voteable_id'], voteable_type: params['voteable_type'], user_id: 10).first_or_create
    @vote.update_attributes(value: params["value"])
    @voteable_type = params["voteable_type"]
    @voteable_id = params["voteable_id"]
    if @voteable_type == 'Article'
      @count = Article.find(params['voteable_id']).votes.sum(:value)
    elsif @voteable_type == 'Comment'
      @count = Comment.find(params['voteable_id']).votes.sum(:value)
    end
    @vote.save

  end

  def update
    p "Update"
    p params
  end

  def destroy

  end
end
