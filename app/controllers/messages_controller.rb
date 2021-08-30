class MessagesController < ApplicationController
  before_action :set_event

  def create
    @message = Message.new(message_params)
    @message.event = @event
    @message.user = current_user
    if @message.save!
      EventChannel.broadcast_to(@event, render_to_string(partial: "message", locals: { message: @message }))
    end
  end

  def show
    @message = Message.new
    @disable_footer = @disable_header = true
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
