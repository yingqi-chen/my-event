class CommentsController < ApplicationController
    before_action :authenticate_user, :authorized_commentor?, only: [:new,:create,:edit,:update]

   def new
    @comment = Comment.new
    @commenting_user = current_user
    if params[:volunteer_id]
      @commented_user = User.find_by id: params[:volunteer_id]
    end
   end

   def create 
    binding.pry
    @comment = Comment.new(comment_params)
    @comment.organization_id = session[:user_id]
    if @comment.save
      redirect_to comment_path(@comment)
    else
      render 'new'
   end
  end

   def show
   end

   def edit

   end

   def update

   end


   def destroy
   end







private

   def authorized_commentor?
     unless current_user.is_organization
       flash[:error] = "Only organization can comment on a volunteer."
       render 'new'
     end
   end

   def comment_params
    params.require(:comment).permit(:organization_id, :volunteer_id, :event_id,:content)
  end

end
