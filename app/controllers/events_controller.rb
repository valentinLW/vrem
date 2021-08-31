class EventsController < ApplicationController
  def index
    start_date = params.fetch(:start_time, Date.today).to_date
    @events = Event.where(start_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
    @invitations = Invitation.where(user: current_user).where(status: :pending)
    @invited = Invitation.where(user: current_user).where(status: :accepted)
    @disable_back = true
  end

  def show
    @event = Event.find(params[:id])
    if @event.end_time < Date.today
      @images = %w[
        https://res.cloudinary.com/dluzejx2p/image/upload/v1630068088/IMG_9796_cz8acp.jpg
        https://res.cloudinary.com/dluzejx2p/image/upload/v1630068088/IMG_9806_p3gvti.jpg
        https://res.cloudinary.com/dluzejx2p/image/upload/v1630068088/IMG_9797_hb2d3n.jpg
        https://res.cloudinary.com/dluzejx2p/image/upload/v1630068088/IMG_9794_nfjvqp.jpg
        https://res.cloudinary.com/dluzejx2p/image/upload/v1630068088/IMG_9793_qykuzu.jpg
        https://res.cloudinary.com/dluzejx2p/image/upload/v1630068088/IMG_9802_hhtsaz.jpg
        https://res.cloudinary.com/dluzejx2p/image/upload/v1630068088/IMG_9807_jarebx.jpg
        https://res.cloudinary.com/dluzejx2p/image/upload/v1630068089/IMG_9800_natezf.jpg
        https://res.cloudinary.com/dluzejx2p/image/upload/v1630068089/IMG_9801_lf78ic.jpg
        https://res.cloudinary.com/dluzejx2p/image/upload/v1630068089/IMG_9790_rtcehh.jpg
        https://res.cloudinary.com/dluzejx2p/image/upload/v1630068089/IMG_9799_zdgqqz.jpg
        https://res.cloudinary.com/dluzejx2p/image/upload/v1630068088/IMG_9792_hdjhtg.jpg
        https://res.cloudinary.com/dluzejx2p/image/upload/v1630068089/IMG_9791_zv0nox.jpg
        https://res.cloudinary.com/dluzejx2p/image/upload/v1630068089/IMG_9798_vtd5gs.jpg
        https://res.cloudinary.com/dluzejx2p/image/upload/v1630068089/IMG_9808_tlfar4.jpg
        https://res.cloudinary.com/dluzejx2p/image/upload/v1630071585/IMG_9788_e24chh.png
        ]
      render :past_show
    end

    @message = Message.new
    @invitation = Invitation.where(user: current_user).where(event: @event).first
    @markers = { lat: @event.latitude, lng: @event.longitude }
  end

  def new
    @event = Event.new
    @disable_nav_right = true
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
