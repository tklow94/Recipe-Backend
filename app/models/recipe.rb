class Recipe < ApplicationRecord
  has_many :comments, as: :commentable, dependent: :destroy
  belongs_to :user
  has_one_attached :avatar

end
