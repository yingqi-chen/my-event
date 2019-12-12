class EventsController < ApplicationController
    before_action :authenticate_user, only: [:show, :edit, :new, :destroy]
    before_action :find_event, only: [:show, :edit, :update, :destroy]
    

    def index
        if params[:user_id]
            binding.pry
            @user = User.find_by :id=>params[:user_id]
            if @user && @user.is_organization
              @events = @user.organized_events
            elsif @user && !@user.is_organization
              @events = @user.joined_events
            else
              flash[:error] = "The user doesn't exist."
              redirect_to users_path
            end
        else
            @events = Event.all
        end   
    end

    def new
        @user = current_user
        if @user.is_organization
           @event = Event.new
           @location1 = @event.locations.build
        else
           flash[:error] = "Only organization user can create an event."
           redirect_to events_path
        end
    end

    def create
        @event = Event.new(event_params)
        @user = current_user
        @event.organization = @user
        if @event.save
            redirect_to event_path(@event)
        else
            render 'new'
        end
    end

    def edit
        @user = @event.organization
        authorized_user?
    end

    def show
        @organization = @event.organization
        @volunteers = @event.volunteers
        @comments = @event.comments   
    end

    def update
        @event.update(event_params)
        redirect_to event_path(@event)
    end
    
    def destroy
        if current_user == @event.organization
            @event.delete
            redirect_to events_path
        else
            flash[:error] = "Only the creator can delete this event."
            redirect_to event_path(@event)
        end
    end


private
    def find_event
        @event = Event.find_by :id=>params[:id] 
        unless @event
          flash[:error] = "There is no such event."
          redirect_to '/events'
        end
      end

      def event_params
        params.require(:event).permit(:name,:contact_email,:phone_number, :is_free,:description, :start_date, :end_date, 
        locations_attributes: [
            :street_address_1,
            :street_address_2,
            :city,
            :state,
            :zipcode
          ])
      end
end
