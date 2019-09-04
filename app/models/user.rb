class User < ApplicationRecord
    has_secure_password
    validates :first_name, :last_name, presence: true
    validates :email, presence: true, uniqueness: { case_sensitve: false }
    validates_format_of :email, :with => /@/
    has_many :followed_users, foreign_key: :follower_id, class_name: 'Follow', :dependent => :destroy
    has_many :followees, through: :followed_users, :dependent => :destroy
    has_many :following_users, foreign_key: :followee_id, class_name: 'Follow', :dependent => :destroy
    has_many :followers, through: :following_users, :dependent => :destroy
    has_many :posts, :dependent => :destroy
    has_many :comments, :dependent => :destroy
    has_many :likes, :dependent => :destroy
end
    
    
