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
        binding.pry
        log_in_first
        @user = User.find_by id: params[:id]
        correct_user?
        if @user
            render 'show'
        else
            redirect_to '/login'
        end
    end



    private
      def user_params
        params.require(:user).permit(:name,:password,:email,:email_confirmation)
      end
end
