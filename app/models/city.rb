class City < ActiveRecord::Base
  has_many :itineraries
  has_many :articles, through: :itineraries
end
