class CommentsController < ApplicationController
    

   def new
    @comment = Comment.new
    authorized_commentor?
    @user = current_user
   end








   
   def authorized_commentor?
     unless current_user.is_organization
       flash[:error] = "Only organization can comment on a volunteer."
       render 'new'
     end
   end
end
