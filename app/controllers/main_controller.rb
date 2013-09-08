class MainController < ApplicationController
  def index
    @cities = City.all
    @categories = Category.all
  end
  def filter
    filter_hash = {city: params["city"], writer: params["writer"], category: params['category'], writer_type: params["writer_type"]}

    @articles = Article.filter(filter_hash)
    render json: {articles: @articles}
  end
end
