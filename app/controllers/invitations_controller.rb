class InvitationsController < ApplicationController
  before_action :event_by_event_id, only: %i[index create]
  before_action :event_by_id_and_invitation, only: %i[accept reject]

  def index
    @invitations = Invitation.where(event: @event)
    @users = User.joins("LEFT JOIN invitations ON invitations.user_id = users.id").where("invitations.id IS NULL")
    @invitation = Invitation.new
  end

  def create
    @user = User.find(params[:event_id])
    @invitation = Invitation.new(event: @event, user:@user)
    @invitation.save!
  end

  def accept
    @invitation.accepted!
  end

  def reject
    @invitation.rejected!
  end

  private

  def event_by_id_and_invitation
    @event = Event.find(params[:id])
    @invitation = Invitation.where(event: @event).where(user: current_user).first
  end

  def event_by_event_id
    @event = Event.find(params[:event_id])
  end
end
