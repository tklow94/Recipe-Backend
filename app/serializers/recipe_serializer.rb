class RecipeSerializer < ActiveModel::Serializer
  attributes :id,  :name, :url, :ingredients, :calories, :daily_value, :daily_value_percent, :calories_per_serving, :servings, :img, :source, :user_id
  has_many :comments, as: :commentable, dependent: :destroy
  belongs_to :user


  def calories_per_serving
    calories_per_serving = object.calories.to_i, object.servings.to_i
      return calories_per_serving.to_s
  end

  def daily_value_percent
    daily_value_percent = object.daily_value.to_i,  object.servings.to_i.nonzero?
    return daily_value_percent
  end

  end

