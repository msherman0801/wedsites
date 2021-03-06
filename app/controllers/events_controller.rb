class EventsController < DashboardController

    def index
        @events = current_website.events.all
    end

    def new
        @event = Event.new
        @invitations = current_website.invitations
    end
    
    def create
        event = Event.create(event_params)
        current_website.events << event
        redirect_to events_path
    end
    
    def show
        @event = id(Event)
    end

    def edit
        @event = id(Event)
        @invitations = current_website.invitations
    end

    def update
        event = id(Event)
        event.update(event_params)
        event.save
        redirect_to events_path
    end

    def destroy
        id(current_website.events).destroy
        redirect_to events_path
    end

    def data
        events = id(Website).events
        binding.pry
        render json: events
    end

    private

    def event_params
        params.require(:event).permit(:title, :description, :date, :location, :attire)
    end
end
