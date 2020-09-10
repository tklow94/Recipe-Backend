class CommentsController < ApplicationController
  # before_action :authenticate, only: [:create]
  before_action :find_commentable, only: :create
  # skip_before_action :authorized, only: [:index, :show, :create ]
  

  def index
    @comments = Comment.where("recipe_id = ?", params[:recipe_id])
   
    render json: {comments: @comments}
  end
def new
  @comment = Comment.new
end

def create
  # content: "This is so great!",
  # recipe_id: 1,
  # commentable_id: 1,
  # commentable_type: "Recipe",
  # user_id: 1

  # @comment = @commentable.comments.new(params[:content])
  @comment = Comment.new(
    content: params[:content],
    recipe_id: params[:recipe_id],
    commentable_id: @commentable.id,
    commentable_type: params[:commentable_type],
    user_id: params[:user_id]
  )

  if @comment.save
    render json: {comment: @comment}, status: :created
  else
    render json: {message: @comment.errors.full_messages}
end
end
  # def create
  #   @recipe = Recipe.find_by(params[:recipe_id])
    
  #   @comment = @commentable.comments.create({
  #       content: params[:content],
  #       recipe: @recipe,
  #       user: @user
  #   })
   
  #   render json: {comment: @comment}, status: :created
  # end


  def destroy
  end

  private

  def find_commentable
   
    @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id ]
  
    @commentable = Recipe.find_by_id(params[:recipe_id]) if params[:recipe_id]
    # if (params[:commentable_type] == "Recipe")
  end


  
end
