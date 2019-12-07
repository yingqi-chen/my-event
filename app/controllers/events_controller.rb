class EventsController < ApplicationController
    before_action :authenticate_user, only: [:show, :edit, :new]
    before_action :find_event, only: [:show, :edit]
    

    def index
        @events = Event.all
    end

    def new
        @event = Event.new
        @user = current_user
        @location1 = @event.locations.build
    end

    def create
        binding.pry
        @event = Event.new(event_params)
        @user = current_user
        @event.organization = @user
        if @event.save
            binding.pry
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

    end

    def update
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
