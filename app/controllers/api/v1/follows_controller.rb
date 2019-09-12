class Api::V1::FollowsController < ApplicationController
    skip_before_action :authorized, only: [:index]


    def create
        @follow = Follow.create(follow_params)
        if @follow.valid?
            render json: { follow: @follow }, status: :created
        else
            render json: { error: "there was a problem trying to follow this user, please try again later" }, status: :not_acceptable
        end
    end

    def index
        @follows = Follow.all
        render json: { follows: @follows }
    end


    def destroy
        follow = Follow.find_by(id: params[:id])
        follow.destroy
        render json: { message: "successfully unfollowed user" }, status: :ok
    end


    private
    
    def follow_params
        params.require(:follow).permit(:followee_id).merge(follower_id: current_user.id)
    end


end
