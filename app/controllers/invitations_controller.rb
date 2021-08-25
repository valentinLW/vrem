class InvitationsController < ApplicationController
  before_action :set_event, only: %i[index create]
  before_action :set_invitation, only: %i[accept reject]

  def index
    @invitations = Invitation.where(event: @event)
    @invitation = Invitation.new
    @not_guests = User.where.not(id: @event.invitations.pluck(:user_id))
  end

  def create
    @user = User.find(params[:user_id])
    @invitation = Invitation.new(event: @event, user: @user)
    @invitation.save!
  end

  def accept
    @invitation.accepted!
  end

  def reject
    @invitation.rejected!
  end

  private

  def set_invitation
    @invitation = Invitation.find(params[:id])
  end

  def set_event
    @event = Event.find(params[:event_id])
  end
end
