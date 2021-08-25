class InvitationsController < ApplicationController
  before_action :set_event, only: %i[index create]
  before_action :set_invitation, only: %i[accept reject]

  def index
    @invitations = Invitation.where(event: @event)
    @users = User.joins("LEFT JOIN invitations ON invitations.user_id = users.id").where("invitations.id IS NULL")
    @allusers = User.all
    @invitation = Invitation.new
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
