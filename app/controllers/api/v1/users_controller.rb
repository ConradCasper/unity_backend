class Api::V1::UsersController < ApplicationController
    skip_before_action :authorized, only: [:create, :index]


    def profile
        render json: { user: current_user }, status: :accepted
    end

    def index
        @users = User.all
        render json: { users: @users }
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
        params.require(:user).permit(:first_name, :last_name, :email, :password)
    end


end







