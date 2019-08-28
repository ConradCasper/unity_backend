class User < ApplicationRecord
    has_secure_password
    validates :first_name, :last_name, presence: true
    validates :email, presence: true, uniqueness: { case_sensitve: false }
    validates_format_of :email, :with => /@/
    has_many :posts
    has_many :post_comments, through: :posts
    has_many :comments
    has_many :commented_posts, through: :comments
    has_many :likes
    has_many :liked_posts, through: :likes
end
