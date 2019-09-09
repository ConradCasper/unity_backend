class Api::V1::PostsController < ApplicationController
    skip_before_action :authorized, only: [:index]

    def index
        posts = Post.all
        @sorted_posts = posts.sort { |a, b| b.created_at <=> a.created_at }
        render json: { posts: @sorted_posts }
    end

    def create
        @post = Post.create(post_params)
        if @post.valid?
            render json: { post: @post }
        else
            render json: { error: 'failed to create post' }, status: :not_acceptable
        end
    end


    def edit
        @post = Post.find_by(id: params[:id])
        render json: { post: @post }
    end


    def update
        @post = Post.find_by(id: params[:id])
        if @post.user_id === current_user.id
        @post.content = post_params[:content]
        @post.type = post_params[:type]
        @post.img_url = post_params[:img_url]
        @post.save
        redirect_to `/api/v1/profile`
        else
            render json: { error: "you can't edit someone else's post" }, status: :unauthorized
            redirect_to `/api/v1/profile`
        end
    end


    def destroy
        post = Post.find_by(id: params[:id])
        post.destroy
        redirect_to `/api/v1/profile`
    end


    private

    def post_params
        params.require(:post).permit(:content, :type, :img_url).merge(user_id: current_user.id)
    end
        
end


    



