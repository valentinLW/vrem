class InvitationsController < ApplicationController
  def create
    @invitation = Invitation.new(invitation_params)
  end

  private

  def invitation_params
    params.require(:invitation).permit(:user_id)
  end
end
