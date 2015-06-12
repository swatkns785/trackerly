class SchoolDistrictInvitesController < ApplicationController
  def create
    @invite = SchoolDistrictInvite.new(sdi_params)
    @invite.sender_id = current_user.id

    if @invite.save
      SchoolDistrictInviteMailer.new_user_invitation(@invite,
        new_user_registration_path(invite_token: @invite.token)).deliver
    redirect_to school_district_path(@invite.school_district_id)
    else
      ###write error handling functionality
    end
  end

  def sdi_params
    params.require(:school_district_invite).permit(:email, :sender_id,
      :recipient_id, :token, :school_district_id)
  end
end
