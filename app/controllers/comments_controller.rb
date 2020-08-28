class CommentsController < ApplicationController
  before_action :find_commentable, only: :create

  def index
    @comments = Comment.all
    render json: {comments: @comments}
  end

  def create
    @recipe = Recipe.find_by(params[:recipe_id])
    @comment = @commentable.comments.create({
        content: params[:content],
        recipe: @recipe
    })
   
    render json: {comment: @comment}, status: :created
  end

  def destroy
  end

  private

  def find_commentable
    if params[:comment_id]
      @commentable = Comment.find_by_id(params[:comment_id]) 
    elsif params[:recipe_id]
      @commentable = Recipe.find_by_id(params[:recipe_id])
    end
  end


  
end
