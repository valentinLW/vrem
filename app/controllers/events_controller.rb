class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def pastindex
    @events = Event.all
    @past_events = @events.end_time <= Date.today
  end

  def upcomingindex
    @events = Event.all
    @upcoming_events = @events.end_time >= Date.today
  end

  def show
    @event = Event.find(params[:id])
    if @event.end_time <= Date.today
      render :show
    else
      render :pastshow
    end
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user

    if @event.save!
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @event.update(shoe_params)
    redirect to event_path(@event)
  end

  private

  def event_params
    params.require(:event).permit(
      :name,
      :description,
      :location,
      :start_time,
      :end_time,
      :image
    )
  end
end
