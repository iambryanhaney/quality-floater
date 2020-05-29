class UsersController < ApplicationController
    before_action :get_user, only: [:show]
    before_action :get_session_user, only: [:edit, :update]
    skip_before_action :authorized, only: [:new, :create]

    def show
        @user_ratings = Quality.all.order(:name).map {|q| 
                {
                    name: q.name, 
                    rating_raw: @user.quality_rating_raw(q.id), 
                    rating_weighted: @user.quality_rating_weighted(q.id),
                    user_count: @user.classifications_received.where(quality_id: q.id).count,
                    classifier_avg: @user.classifiers_quality_average_raw(q.id),
                    max_rating: User.all.map{|user| user.quality_rating_raw(q.id)}.sort.last
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

    def create
        @user = User.new(new_user_params)
        if @user.valid?
            @user.display_name = @user.username
            @user.save
            session[:current_user_id] = @user.id
            redirect_to posts_path
        else
            render :new
        end
    end

    def edit
    end

    def update
        @user.display_name = params[:display_name]
        if @user.valid?
            @user.save
            redirect_to user_path(@user)
        else 
            session[:errors] = @user.errors
            render :edit
        end
    end

    def logout
        session[:current_user_id] = nil
        redirect_to welcome_path
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

    def get_session_user
        @user = User.find(session[:current_user_id])
    end
end
