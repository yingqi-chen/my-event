class CommentsController < ApplicationController
    before_action :authenticate_user, :authorized_commentor?, only: [:new,:create,:edit,:update]
    before_action :find_comment, only: [:show, :edit, :update,:destroy]

   def new
    @comment = Comment.new
    @commenting_user = current_user
    if params[:volunteer_id]
      @commented_user = User.find_by id: params[:volunteer_id]
    end
   end

   def create 
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
     binding.pry
     if @comment.update(comment_params)
       redirect_to comment_path(@comment)
     else
       render 'edit'
     end
   end


   def destroy
    if @comment.organization = current_user
      @comment.delete
    else
      flash[:error] = "You have no right to continue this operation."
    end
    redirect_to user_path(current_user)
   end


private

def comment_params
  params.require(:comment).permit(:organization_id, :volunteer_id, :event_id,:content)
end

def find_comment
  @comment = Comment.find_by id:params[:id]
  unless @comment
    flash[:error] = "This comment doesn't exist."
    redirect_to user_path(current_user)
  end
end

def authorized_commentor?
  unless current_user.is_organization
    flash[:error] = "Only organization can comment on a volunteer."
    render 'new'
  end
end


end
