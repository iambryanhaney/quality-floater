class UsersController < ApplicationController
    before_action :get_current_user, only: [:show]
    skip_before_action :authorized, only: [:new, :create]

    def show
    end

    def new 
        @user = User.new
    end

    def logout
        session[:current_user_id] = nil
        redirect_to welcome_path
    end

    def create
        @user = User.create(new_user_params)
        session[:current_user_id] = @user.id
        redirect_to user_path
    end


    # Helper Methods

    private 
    def new_user_params
        params.require(:user).permit(:username, :password)
    end

    private
    def edit_user_params
        params.require(:user).permit(:username, :display_name, :password)
    end

    private 
    def get_current_user
        @user = current_user
    end

end
