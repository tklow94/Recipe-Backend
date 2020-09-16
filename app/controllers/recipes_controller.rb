
class RecipesController < ApplicationController
  before_action :authenticate, only: [:create]
  
  def index
    recipes = Recipe.all
    render json: {recipes: recipes}
  end

  def show
    recipe_id = params[:id]
    recipe = Recipe.find(recipe_id)
    render json: recipe
  end

 

  def create
    image = Cloudinary::Uploader.upload(params[:img])["url"]
    @recipe = Recipe.new({
      name: params[:name],
      url: params[:url],
      ingredients: params[:ingredients],
      calories: params[:calories],
      daily_value: params[:daily_value],
      servings: params[:servings],
      img: image,
      source: params[:source],
      user: @user 
      
    })
    @recipe.save!
    if @recipe.persisted?
      render json: { recipe: RecipeSerializer.new(@recipe) }, status: :created
    else
      render json: {error: "Failed to create a recipe"}
  end

  end

  def destroy
    Recipe.destroy(params[:id])
    head :ok
  end
end


