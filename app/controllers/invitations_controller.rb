class InvitationsController < ApplicationController
  def index
    @event = Event.find(params[:event_id])
    @invitations = Invitation.where(event: @event)
    @users = User.joins("LEFT JOIN invitations ON invitations.user_id = users.id").where("invitations.id IS NULL")
    @invitation = Invitation.new
  end

  def create
    @event = Event.find(params[:event_id])
    @user = User.find(params[:event_id])
    @invitation = Invitation.new(event: @event, user:@user)
    @invitation.save!
  end
end
