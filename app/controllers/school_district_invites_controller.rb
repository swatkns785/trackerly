class SchoolDistrictInvitesController < ApplicationController
  def create
    @invite = SchoolDistrictInvite.new(sdi_params)
    @invite.sender_id = current_user.id
    if @invite.save
      if @invite.recipient != nil
        SchoolDistrictInviteMailer.existing_user_invitation(@invite,
          new_user_session_path(invite_token: @invite.token,
          account_type: @invite.account_type)).deliver

        flash[:notice] = "Invitation sent."
        redirect_to school_district_path(@invite.school_district_id)
      else
        SchoolDistrictInviteMailer.new_user_invitation(@invite,
          new_user_registration_path(invite_token: @invite.token)).deliver
        flash[:notice] = "Invitation sent."
        redirect_to school_district_path(@invite.school_district_id)
      end
    else
      flash[:alert] = "Could not send email(s)."
      redirect_to school_district_path(@invite.school_district_id)
    end
  end

  private

  def sdi_params
    params.require(:school_district_invite).permit(:email, :sender_id,
      :recipient_id, :token, :school_district_id, :account_type)
  end
end
