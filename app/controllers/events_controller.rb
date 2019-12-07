class EventsController < ApplicationController
    before_action :find_event, only: [:show, :edit]
    
    def find_event
      @event = Event.find_by :id=>params[:id] 
      unless @event
        flash[:error] = "There is no such event."
        redirect_to '/events'
      end
    end

    def index
        @events = Event.all
    end

    def edit
        @user = @event.organization
        authorized_user?
    end

    def show

    end

    def update
    end
end
