class InvitationsController < ApplicationController
  def index
    @users = User.all
    @invitations = Invitation.all
    @event = Event.find(params[:event_id])
    @invitation = Invitation.new
  end

  def create
    @event = Event.find(params[:event_id])
    @user = User.find(params[:event_id])
    @invitation = Invitation.new(event: @event, user:@user)
    @invitation.save!
  end

end
