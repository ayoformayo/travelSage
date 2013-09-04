class Article < ActiveRecord::Base
  has_many :tags
  has_many :categories, through: :tags
  has_many :itineraries
  has_many :cities, through: :itineraries
  belongs_to :user
end
