class Api::V1::UsersController < ApplicationController
    skip_before_action :authorized, only: [:create, :index]


    def profile
        render json: { user: current_user }, status: :accepted
    end

    def index
        @users = User.all
        render json: { users: @users }
    end

    

    def update
        @user = User.find_by(id: user_params[:id])
        @user.avatar = user_params[:avatar]
        @user.first_name = user_params[:first_name]
        @user.last_name = user_params[:last_name]
        @user.background_img = user_params[:background_img]
        @user.interests = user_params[:interests]
        @user.bio = user_params[:bio]
        @user.favorite_bands = user_params[:favorite_bands]
        if @user.save
            render json: { user: @user }
        else render json: { error: 'failed to update user' }, status: :not_acceptable
        end
    end


    def create
        @user = User.create(user_params)
        if @user.valid?
            @token = encode_token(user_id: @user.id)
            render json: { user: @user, jwt: @token }, status: :created
        else
            render json: { error: 'failed to create user' }, status: :not_acceptable
        end
    end


    private
    def user_params
        params.require(:user).permit(:id, :first_name, :last_name, :email, :password, :avatar, :background_img, :interests, :bio, :favorite_bands)
    end


end







