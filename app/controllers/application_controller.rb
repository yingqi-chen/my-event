class ApplicationController < ActionController::Base



    def current_user
      User.find_by :id=>session[:user_id]
    end

    def log_in?
      !!session[:user_id]
    end

    def log_in_first
        if !log_in?
          session[:error]="You have to log in first to continue your operation"
          redirect_to "/login"
        end
      end

      def correct_user?
        if !(current_user.id==@user.id)
          session[:error]="You have no right to do this operation."
          redirect_to "/"
        end
      end

end
