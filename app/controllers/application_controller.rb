class ApplicationController < ActionController::Base



    def current_user
      User.find_by :id=>session[:user_id]
    end

    def log_in?
      !!session[:user_id]
    end

    def authenticate_user
      unless log_in?
        flash[:error] = "You have to log in first."
        redirect_to '/login'
      end
    end

end
