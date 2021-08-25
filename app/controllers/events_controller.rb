class EventsController < ApplicationController

  def index
    start_date = params.fetch(:start_time, Date.today).to_date
    @events = Event.where(start_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
    @invitations = Invitation.where(user: current_user).where(status: :pending)
  end

  def show
    @event = Event.find(params[:id])
    @message = Message.new
    @invitation = Invitation.where(user: current_user).where(event: @event).first
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user

    if @event.save
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
      :end_time
    )
  end
end
