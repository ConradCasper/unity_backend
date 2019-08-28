class Api::V1::CommentsController < ApplicationController
    skip_before_action :authorized

    def create
        @comment = Comment.create(comment_params)
        if @comment.valid? 
            render json: { comment: @comment.to_json( :include => {
                :user => { :only => [:id, :first_name, :last_name, :avatar] }
            })}
        else
            render json: { error: 'failed to create comment' }, status: :not_acceptable
        end
    end


    def destroy
        comment = Comment.find_by(params[:id])
        if comment.user_id === current_user.id
        comment.destroy
        else
            render json: { error: "you can't delete someone else's comment just because you don't like it!" }, status: :unauthorized
        end

    end


    private

    def comment_params
        params.require(:comment).permit(:post_id, :content).merge(user_id: current_user.id)
    end
end
