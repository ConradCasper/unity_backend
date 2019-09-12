class Api::V1::CommentsController < ApplicationController
    skip_before_action :authorized, only: [:index]

    def create
        @comment = Comment.create(comment_params)
        if @comment.valid? 
            render json: { comment: @comment }
        else
            render json: { error: 'failed to create comment' }, status: :not_acceptable
        end
    end

    def index
        comments = Comment.all
        @sorted_comments = comments.sort { |a, b| b.created_at <=> a.created_at }
        render json: { comments: @sorted_comments }
    end


    def destroy
        @comment = Comment.find_by(id: params[:id])
        if @comment.user_id === current_user.id
        @comment.destroy
            render json: { comment: @comment }
        end

    end


    private

    def comment_params
        params.require(:comment).permit(:post_id, :content).merge(user_id: current_user.id)
    end
end
