class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
          session[:user_id]=@user.id
          redirect_to user_path(@user)
        else
          render 'new'
        end
    end

    def show
      if log_in?
          @user = User.find_by id: params[:id]
          if @user
              related_events_and_comments
              render 'show' 
          else
              flash[:error] = "That user doesn't exist."
              redirect_to '/login'
          end
      else
        flash[:error] = "You have to log in first."
        redirect_to '/login'
      end
    end



    private
      def user_params
        params.require(:user).permit(:name,:password,:email,:email_confirmation)
      end

      def related_events_and_comments
        if @user.is_organization
          @events = @user.organized_events
          @comments = @user.commented_comments
        else
          @events = @user.joined_events
          @comments = @user.being_commented_comments
        end
      end

end
