class EventsController < ApplicationController
  def index
    start_date = params.fetch(:start_time, Date.today).to_date
    @events = Event.where(start_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week).sort_by{|e| e.start_time}
    @invitations = Invitation.where(user: current_user).where(status: :pending).sort_by{|a| a.event.start_time}
    @invited = Invitation.where(user: current_user).where(status: :accepted)
    @disable_back = @disable_home = true
  end

  def show
    @event = Event.find(params[:id])
    @message = Message.new
    @invitation = Invitation.where(user: current_user).where(event: @event).first
    @markers = { lat: @event.latitude, lng: @event.longitude }
    @uploads = Upload.where(event_id: params[:id])
    @disable_back = true
  end

  def new
    @event = Event.new
    @disable_nav_right = @disable_home = true
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
      :end_time,
      :image
    )
  end
end
