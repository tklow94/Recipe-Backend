
class RecipesController < ApplicationController
 
  # skip_before_action :authorized, only: [:index, :show]
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
      user: @user #get from AC
      
    })
  
    # byebug
    @recipe.save!
    # byebug
    if @recipe.persisted?
    
      render json: { recipe: RecipeSerializer.new(@recipe) }, status: :created
    # render json: {recipe: @recipe}, status: :created
  else
    render json: {error: "Failed to create a recipe"}
  end

  end

  # def bank
    
  #   @recipe = Recipe.new({
  #     name: params[:name],
  #     url: params[:url],
  #     ingredients: params[:ingredients],
  #     calories: params[:calories],
  #     daily_value: params[:daily_value],
  #     servings: params[:servings],
  #     img: params[:img],
  #     source: params[:source],
  #      #get from AC
      
  #   })

  
  #   # byebug
  #   @recipe.save!
  #   # byebug
  #   if @recipe.persisted?
    
  #     render json: { recipe: RecipeSerializer.new(@recipe) }, status: :created
  #   # render json: {recipe: @recipe}, status: :created
  # else
  #   render json: {error: "Failed to create a recipe"}
  # end
  # end

  # def update
  #   image = Cloudinary::Uploader.upload(params[:img])["url"]

  #   @recipe = Recipe.find_by(params[:recipe_id])

  #   if @recipe.update({
  #     name: params[:name],
  #     url: params[:url],
  #     ingredients: params[:ingredients],
  #     calories: params[:calories],
  #     daily_value: params[:daily_value],
  #     servings: params[:servings],
  #     img: image,
  #     source: params[:source],
  #     user: @user
  #   })
  # else
  #   render json: @recipe
  # end
  # render json: {message: "Success!!!"}
  # end

  

  def destroy
   
    Recipe.destroy(params[:id])

    head :ok
  end
end


