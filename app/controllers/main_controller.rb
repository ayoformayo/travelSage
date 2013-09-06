class MainController < ApplicationController
  def index
    @cities = City.all
  end
  def filter
    filter_hash = {city: params["city"], writer: params["writer"], categories: params['category'], writer_type: params["writer_type"]}

    @articles = Article.filter(filter_hash)
    render json: {articles: @articles}
  end
end
