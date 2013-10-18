class ArticlesController < ApplicationController
  def show
    @comment = Comment.new
    @article = Article.find(params["id"])
  end
end
