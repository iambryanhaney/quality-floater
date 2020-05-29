class PostsController < ApplicationController
    before_action :get_post, only: [:show]
    def index
        @posts = Post.all.order(id: :desc)
    end

    def show
        @post_ratings = Quality.all.order(:name).map do |quality| 
            {
                name: quality.name, 
                id: quality.id,
                rating: @post.quality_rating(quality.id), 
                user_count: @post.classifications.where(quality_id: quality.id).count,
                classifiers_average: @post.classifiers_quality_average_raw(quality.id)
            }
        end
        @session_user = User.find(session[:current_user_id])
        # if params[:sort_by_rating]
        #     @user_ratings.sort_by! { |rating| rating[:rating_raw] }.reverse!
        #     puts @user_ratings
        # else
        #     @user_ratings.sort_by! { |rating| rating[:name] }
        # end
    end

    private
    def get_post
        @post = Post.find(params[:id])
    end
end
