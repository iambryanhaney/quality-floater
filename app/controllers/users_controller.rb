class UsersController < ApplicationController
    before_action :get_user, only: [:show]
    skip_before_action :authorized, only: [:new, :create]

    def show
        @user_ratings = Quality.all.order(:name).map {|q| 
                {
                    :name => q.name, 
                    :rating_raw => @user.quality_rating_raw(q.id), 
                    :rating_weighted => @user.quality_rating_weighted(q.id),
                    :user_count => @user.classifications_received.where(quality_id: q.id).count,
                    :classifier_avg => @user.classifiers_quality_average_raw(q.id)
                }
            }
        if params[:sort_by_rating]
            @user_ratings.sort_by! { |rating| rating[:rating_raw] }.reverse!
            puts @user_ratings
        else
            @user_ratings.sort_by! { |rating| rating[:name] }
        end
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
        redirect_to posts_path
    end

    # Helper Methods

    private 
    def new_user_params
        params.require(:user).permit(:username, :password)
    end

    def edit_user_params
        params.require(:user).permit(:username, :display_name, :password)
    end

    def get_user
        @user = User.find(params[:id])
    end
end
