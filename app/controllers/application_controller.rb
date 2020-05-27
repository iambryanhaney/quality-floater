class ApplicationController < ActionController::Base
    before_action :authorized
    skip_before_action :authorized, only: [:new, :create]

    def current_user
        if session[:current_user_id]
            User.find_by(id: session[:current_user_id])
        end
    end

    def logged_in?
        !!current_user
    end

    def authorized
        redirect_to welcome_path unless logged_in?
    end
end
