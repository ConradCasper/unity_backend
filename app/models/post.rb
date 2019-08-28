class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :liking_users, through: :likes
  has_many :comments
  has_many :commenting_users, through: :comments
end
