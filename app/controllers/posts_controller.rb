class PostsController < ApplicationController
    before_action :get_post, only: [:show, :classify]
    before_action :get_session_user, only: [:show, :classify]

    def index
        @posts = Post.all.order(id: :desc)
    end

    def new 
    end

    def create 
        @post = Post.new(post_params)
        @post.user = User.find(session[:current_user_id])
        @post.save
        redirect_to posts_path
    end

    def show
        @post_ratings = Quality.all.order(:name).map do |quality| 
            {
                name: quality.name, 
                id: quality.id,
                rating: @post.quality_rating(quality.id), 
                user_count: @post.classifications.where(quality_id: quality.id, active: true).count,
                classifiers_average: @post.classifiers_quality_average_raw(quality.id),
                is_classified: !@session_user.classifications_made.where(post_id: @post.id, quality_id: quality.id, active: true).empty?,
            }
        end
        # if params[:sort_by_rating]
        #     @user_ratings.sort_by! { |rating| rating[:rating_raw] }.reverse!
        #     puts @user_ratings
        # else
        #     @user_ratings.sort_by! { |rating| rating[:name] }
        # end
    end

    def classify
        if params[:is_classified] == "true"
            @session_user.declassify_post(@post, params[:quality_id])
        else
            @session_user.classify_post(@post, params[:quality_id])
        end
        redirect_to post_path(@post)
    end

    private
    def get_post
        @post = Post.find(params[:id])
    end

    def get_session_user
        @session_user = User.find(session[:current_user_id])
    end

    def post_params
        params.require(:post).permit(:title, :content)
    end
end
