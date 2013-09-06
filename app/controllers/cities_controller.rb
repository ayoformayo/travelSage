class CitiesController < ApplicationController
  def show
    @city = City.find(params["id"])
    @articles = @city.articles
  end
end
