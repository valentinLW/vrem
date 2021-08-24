class InvitationsController < ApplicationController
  def index
    @users = User.all
  end

  def create
    @invitation = Invitation.new(invitation_params)
  end

  private

  def invitation_params
    params.require(:invitation).permit(:user_id)
  end
end
