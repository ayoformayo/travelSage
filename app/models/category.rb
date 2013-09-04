class Category < ActiveRecord::Base
  has_many :articles, through: :tags
end
