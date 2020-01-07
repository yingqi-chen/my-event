class CategoriesController < ApplicationController

   def index
    @categories = Category.all
   end
   
   def create
   end

   def show
     @category = Category.find_by id: params[:id]
     @events = @category.events
     if @category
        render 'show'
     else
        flash[:error] = "That category doesn't exist."
        redirect_to '/categories'
     end
   end

end