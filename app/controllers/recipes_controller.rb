
class RecipesController < ApplicationController
  before_action :authenticate, only: [:create]


  def index
   
    recipes = Recipe.all
    

    render json: {recipes: recipes}
  end

  def create
   
    image = Cloudinary::Uploader.upload(params[:img])
    # byebug
    @recipe = Recipe.create({
      name: params[:name],
      url: params[:url],
      ingredients: params[:ingredients],
      calories: params[:calories],
      daily_value: params[:daily_value],
      servings: params[:servings],
      img: image["url"],
      source: params[:source],
      user: @user
      
    })
  

    render json: {recipe: @recipe}, status: :created
  end
end

