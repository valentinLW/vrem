class EventsController < ApplicationController

  def index
    @events = Event.all
    #@events = Event.where(current_user.invitation_token?)
  end

  def show
    @event = Event.find(params[:id])
    @message = Message.new
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
    @event = Event.find(params[:id])
  end

  def update
    @event.update(event_params)
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
      #:image
    )
  end
end
