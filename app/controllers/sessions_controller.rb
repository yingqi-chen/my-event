class SessionsController < ApplicationController
   

    def new
    end

    
    def login
        @user = User.find_by :email=>params[:user][:email]
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:error]="We don't find such an user according to your information,please try again."
            redirect_to '/login'
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to root_path
    end


    
    
end
