class Article < ActiveRecord::Base
  has_many :tags
  has_many :categories, through: :tags
  has_many :itineraries
  has_many :cities, through: :itineraries
  has_many :comments, as: :commentable
  belongs_to :user

  def self.filter(hash)
    # need to make case insensitive
    hash.delete_if {|k,v| v == ""}
    hash[:writer_type] = (hash[:writer_type]) if hash[:writer_type] != nil
    sql_base = "select distinct articles.* from articles
       left outer join tags
       on tags.article_id = articles.id
       left outer join categories
       on tags.category_id = categories.id
       left outer join itineraries
       on itineraries.article_id = articles.id
       left outer join cities
       on itineraries.city_id = cities.id
       join users
       on users.id = articles.user_id"

    condition_array = []
    key_array = []
    hash.each_key {|key| key_array << key}
    key_array.each_with_index do |key, i|
      operator = "and"
      operator = "where" if i == 0
      case key
      when :writer
        sql_base << "\n#{operator} users.username like ?"
        condition_array << hash[:writer]
      when :writer_type
         sql_base << "\n#{operator} users.status in (?)"
        condition_array << hash[:writer_type]
      when :city
        sql_base << "\n#{operator} cities.name like ?"
        condition_array << hash[:city]
      when :category
        sql_base << "\n#{operator} categories.name like ?"
        condition_array << hash[:category]
      end
    end
    sql_array = [sql_base,condition_array].flatten
    articles = Article.find_by_sql(sql_array)
    articles
  end







end
