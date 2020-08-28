class UsersController < ApplicationController

  def index
    users = User.all 
    render json: {user: users}
    
  end

  def show
   
    user_id = params[:id]
    user = User.find(user_id)
    render json: user
  end
  
  def create
    user = User.create({
      username: params[:username],
      password: params[:password]
    })

    render json: user, status: :created
    
  end

  def update
    @user = User.find_by(params[:user_id])

    if @user.update({
      password: params[:password]
    })
  else
    render json: @user
  end
  render json: {message: "Success!!!"}
  end

  def destroy
  end


end

