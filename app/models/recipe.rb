class Recipe < ApplicationRecord
  has_many :comments, as: :commentable, dependent: :destroy
  belongs_to :user
end
