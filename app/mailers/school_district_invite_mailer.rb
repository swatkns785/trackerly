class SchoolDistrictInviteMailer < ApplicationMailer
  def new_user_invitation(invite, registration_path)
    @invite = invite
    @registration_path = registration_path
  end
end
