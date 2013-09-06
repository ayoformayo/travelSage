class Article < ActiveRecord::Base
  has_many :tags
  has_many :categories, through: :tags
  has_many :itineraries
  has_many :cities, through: :itineraries
  belongs_to :user

  def self.filter(hash)
    
    p hash
    hash.delete_if {|k,v| v == ""}
    keys = []
    hash.each {|k,v| keys << k } 
    p keys
    case keys[0]
      when :city
        articles = Article.find_by_city(hash[:city])
      when :writer_type
        articles = Article.find_by_writer_type(hash[:writer_type].to_i)
      when :categories
       articles =  Article.find_by_categories(hash[:categories])
      when :writer
        articles = Article.find_by_writer(hash[:writer])
    end
    keys.shift
    new_array = []
    keys.each do |key|
      case key
        when :city
          city_names = []
          article.cities.each {|city| city_names << city.name}
          articles.delete_if{|article| !city_names.include?(hash[key])}
        when :writer_type
          articles.delete_if{|article| article.user.status != hash[key].to_i}
        when :writer
          articles.delete_if {|article| article.user.username != hash[key]}
      end        
    end
  
    p articles
    
  end

  def self.find_by_city(name)
    cities = City.where(name: name)
    articles = []
    cities.each {|city| articles << city.articles} if cities != nil
    articles.flatten!
  end

  def self.find_by_writer_type(id)
    articles = []
    users = User.where(status: id)
    users.each {|user| articles << user.articles} if users
    articles.flatten!
    articles
  end

  def self.find_by_writer(name)
    user = User.find_by_username(name)
    articles = user.articles if user
    articles.flatten!
    articles
  end

  def self.find_by_categories(array)
    
  end
end
