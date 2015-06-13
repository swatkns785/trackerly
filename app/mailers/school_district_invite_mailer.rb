class SchoolDistrictInviteMailer < ApplicationMailer
  def new_user_invitation(invite, registration_path)
    @invite = invite
    @registration_path = registration_path
    @district_name = @invite.school_district.name
    mail(to: @invite.email, subject: "Invitation to join
        #{@district_name} on Tracker.ly")
  end

  def existing_user_invitation(invite)
    @invite = invite
    @district_name = @invite.school_district.name
    mail(to: @invite.email, subject: "Invitation to join
        #{@district_name} on Tracker.ly")
  end
end
