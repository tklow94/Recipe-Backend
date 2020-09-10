class UsersController < ApplicationController
  before_action :authenticate, only: [  :follow, :unfollow, :update]
  # wrap_parameters :person, include: [:username, :password]
  # skip_before_action :authorized, only: [:create, :index, :show]


  def index
    users = User.all 
    render json: {user: users}
    
  end

  def show
   
    
    @user = User.find(params[:id])
    render json: @user
  end
  


  def create
    secret_key = Rails.application.secrets.secret_key_base[0]

    image = Cloudinary::Uploader.upload(params[:avatar])["url"]
 
    @user = User.create({
      username: params[:username],
      password: params[:password],
      avatar: image
    })
    # byebug

    if @user.valid?
      @token = JWT.encode({user_id: @user.id,
        username: @user.username
    }, secret_key)


      render json: { user: UserSerializer.new(@user), token: @token }, status: :created
    else
      render json: {error: "Failed to create a user"}
    end
  end

  def follow
    follow = User.find(params[:id])
    @user.followees << follow
    render json: @user
  end
  
  def unfollow
    
    follow = User.find(params[:id])

    @user.followed_users.find_by(followee_id: follow.id).destroy
    render json: @user
  end

  # def update
    
  #   image = Cloudinary::Uploader.upload(params[:img])["url"]
  #   # byebug

  #   @user.update({
  #     avatar: image
  #   })

  # end

  # def destroy
  # end


# private
# def user_params
#   params.require(:user).permit(:username, :password, :avatar)
# end



end

