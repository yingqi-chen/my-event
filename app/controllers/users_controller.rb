class UsersController < ApplicationController
  before_action :authenticate_user, only: [:show]
    
    
    def new
        @user = User.new
    end

    def index
      @users_organization = User.all.is_organization
      @users_volunteer = User.all.is_not_organization
    end

    def create
        @user = User.new(user_params)
        binding.pry
        if @user.save
          session[:user_id]=@user.id
          redirect_to user_path(@user)
        else
          render 'new'
        end
    end

    def show
      @current_user = current_user
      @user = User.find_by id: params[:id]
      if @user
          related_events_and_comments
          render 'show' 
      else
        flash[:error] = "That user doesn't exist."
        redirect_to '/'
      end
    end



    private
      def user_params
        params.require(:user).permit(:name,:password,:email,:email_confirmation,:bio,:is_organization)
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
