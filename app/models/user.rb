class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true
    has_secure_password

    has_many :recipes, dependent: :destroy

    # has_many :comments, through: :recipes, dependent: :destroy
    has_many :comments, dependent: :destroy
    # has_many :comments, dependent: :destroy

    has_many :followed_users, foreign_key: :follower_id, class_name: 'Follow'
    has_many :followees, through: :followed_users
    has_many :following_users, foreign_key: :followee_id, class_name: 'Follow'
    has_many :followers, through: :following_users

  
end

