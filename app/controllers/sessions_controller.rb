class SessionsController < ApplicationController 
    skip_before_action :authorized, only: [:new, :create, :welcome]

      def new
      end

      def create
         @user = User.find_by(username: params[:username])
         if @user && @user.authenticate(params[:password])
               session[:current_user_id] = @user.id
               redirect_to posts_path
         else
               session[:login_error] = "Incorrect username or password"
               redirect_to '/login'
         end
      end

      def welcome
         if logged_in? 
               redirect_to posts_path
         end
      end
end