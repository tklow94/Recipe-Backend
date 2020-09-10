class Recipe < ApplicationRecord
  has_many :comments, as: :commentable, dependent: :destroy
  # has_many :comments, dependent: :destroy

  belongs_to :user
 

end
