class Article < ActiveRecord::Base
  has_many :tags
  has_many :categories, through: :tags
  has_many :itineraries
  has_many :cities, through: :itineraries
  belongs_to :user

  def self.filter(hash)
    hash.delete_if {|k,v| v == ""}
    keys = []
    hash.each {|k,v| keys << k } 
    p Article.find_by_city(hash[:city])
  end

  def self.find_by_city(name)
    cities = City.where(name: name)
    articles = []
    cities.each {|city| articles << city.articles} if cities != nil
    articles
  end

  def self.find_by_writer_type(id)
end
