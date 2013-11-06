class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable
end
