class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :password, :avatar
  has_many :recipes
  has_many :comments
  has_many :followed_users, foreign_key: :follower_id, class_name: 'Follow'
  has_many :followees, through: :followed_users
  has_many :following_users, foreign_key: :followee_id, class_name: 'Follow'
  has_many :followers, through: :following_users
end
