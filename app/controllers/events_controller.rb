class EventsController < ApplicationController
  before_action :disable_footer_header, only: %i[new edit]

  def index
    start_date = params.fetch(:start_time, Date.today).to_date
    @events = Event.where(start_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
    @invitations = Invitation.where(user: current_user).where(status: :pending)
    @invited = Invitation.where(user: current_user).where(status: :accepted)

  end

  def show
    @event = Event.find(params[:id])
    render :past_show if @event.end_time < Date.today
    @message = Message.new
    @invitation = Invitation.where(user: current_user).where(event: @event).first
    @markers = { lat: @event.latitude, lng: @event.longitude }
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user

    if @event.save
      @invitation = Invitation.new(user:current_user, event:@event)
      @invitation.accepted!
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    redirect_to event_path(@event)
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

  def disable_footer_header
    @disable_header = @disable_footer = true
  end
end
