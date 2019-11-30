class SessionsController < ApplicationController
   
    def login
    end

    def destroy
        session.delete(:user_id)
        render '/'
    end
    
end
