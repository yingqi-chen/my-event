class EventsController < ApplicationController
    before_action :find_event, only: [:show, :edit]
    
    def find_event
    end

    def index
        @events = Event.all
    end
end
