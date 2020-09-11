class CommentsController < ApplicationController
  before_action :authenticate, only: [:create]
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


  @comment = Comment.new(
    content: params[:content],
    recipe_id: params[:recipe_id],
    commentable_id: @commentable.id,
    commentable_type: params[:commentable_type],
    user_id: params[:user_id],
    username: @user.username,
    avatar: @user.avatar,
  )



  if @comment.save
    render json: {comment: @comment}, status: :created
  else
    render json: {message: @comment.errors.full_messages}
end
end



  def destroy
  end

  private

  def find_commentable
   
    @commentable = Comment.find_by_id(params[:commentable_id]) if params[:commentable_id ]
   
  
    @commentable = Recipe.find_by_id(params[:recipe_id]) if params[:recipe_id] && params[:commentable_type] === "Recipe"
   
  end


  
end
