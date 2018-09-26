class EventsController < ApplicationController
    before_action :logged_in_user, only: [:create]

  def new
      @event = Event.new
  end

  def create
      @event = current_user.hosting_events.build(event_params)
      if @event.save
          flash[:success] = "Event created!"
      else
        render 'new'
      end
  end

  def show
      @event = Event.find(params[:id])
      @attendees = @event.attendees
  end

  def index
      @upcoming_events = Event.upcoming
      @past_events = Event.past
  end

  private

    def logged_in_user
        redirect_to '/signin' unless signed_in?
    end

    def event_params
        params.require(:event).permit(:description)
    end
end
