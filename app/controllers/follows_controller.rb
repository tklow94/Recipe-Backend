class FollowsController < ApplicationController
    def index
        user = User.find_by(params[:user_id])
    
        @received_follows = user.received_follows
        @given_follows = user.given_follows

        render json: {followers: @received_follows, following: @given_follows  }
    end

    def create
        @follow = Follow.new(followed_user_id: params[:followed_user_id])
        user = User.find_by(params[:user_id])
        @follow.follower_id = user.id 

        if @follow.save
            render json: {message: "You have followed"}, status: :created
        else
        render json: {message: "Error"}, status: 422
        end

    end

    def destroy
        user = User.find_by(params[:user_id])

        @follow = user.given_follows.find_by_followed_user_id(params[:id])

        if @follow.destroy
            render json:{message: "You Deleted this dude"}
        else
            render status: 422
        end
    end
    

end
