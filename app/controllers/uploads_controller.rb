class UploadsController < ApplicationController

  def index
    @uploads = Upload.where(event_id: params[:event_id])
  end

  def new
    @upload = Upload.new
    @event = Event.find(params[:event_id])
  end

  def create
    @upload = Upload.new(upload_params)
    @upload.user = current_user
    @upload.event = Event.find(params[:event_id])
    if @upload.save!
      redirect_to event_path(@upload.event)
    else
      render :new
    end
  end
end

  private

def upload_params
  params.require(:upload).permit(:media => [])
end
