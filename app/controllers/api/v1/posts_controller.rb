class Api::V1::PostsController < ApplicationController
    

    def index
        @posts = Post.all
        render json: @posts.to_json( :include => {
            :user => { :only => [:id, :first_name, :last_name, :avatar] },
            :comments => { :include => { :user => { :only => [:id, :first_name, :last_name, :avatar] } }},
            :likes => { :include => { :user => { :only => [:id, :first_name, :last_name] } } }
        } )
    end

    def create
        @post = Post.create(post_params)
        if @post.valid?
            render json: { post: @post }, status: :created
        else
            render json: { error: 'failed to create post' }, status: :not_acceptable
        end
    end


    def edit
        @post = Post.find_by(id: params[:id])
        render json: @post
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


    



