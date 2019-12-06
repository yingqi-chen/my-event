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

    def new_from_google
       auth = request.env['omniauth.auth']['info']
       @user = User.find_or_create_by(email: auth['email'])
       if @user.persisted?
        session[:user_id] = @user.id
        redirect_to user_path(@user)
       else
         @user.name = auth['name']
       end
    end

    def create
        @user = User.create(user_params)
        if @user
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:error] = "Try again to sign up!"
            redirect_to "/"
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to root_path
    end

    private
      def user_params
        params.require(:user).permit(:name,:password,:email,:email_confirmation)
      end
    
    
end
