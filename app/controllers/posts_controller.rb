class PostsController < ApplicationController
    before_action :get_post, only: [:show]
    def index
        @posts = Post.all.order(id: :desc)
    end

    def show
    end

    private
    def get_post
        @post = Post.find(params[:id])
    end
end
