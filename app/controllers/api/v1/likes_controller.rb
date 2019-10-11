class Api::V1::LikesController < ApplicationController
    skip_before_action :authorized, only: [:index]


    def create
        @like = Like.create(like_params)
        if @like.valid?
            render json: { like: @like }
        else
            render json: { error: 'failed to create like' }, status: :not_acceptable
        end
    end

    def index
        @likes = Like.all
        render json: { likes: @likes }
    end


    def destroy
        @like = Like.find(params[:id])
        @like.destroy
        render json: { like: @like }
    end


    private
    def like_params
        params.require(:like).permit(:post_id).merge(user_id: current_user.id)
    end
end
