class MyDevise::RegistrationsController < Devise::RegistrationsController
  def new
    @user = User.new
    @token = params[:invite_token]
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @token = params[:invite_token]
      if @token != nil
        invite = SchoolDistrictInvite.find_by(token: @token)
          .school_district_membership
        @user.school_district_memberships.push(invite)
      end
      sign_in(@user)
      flash[:notice] = "Welcome! You have signed up successfully."
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password,
      :password_confirmation)
  end
end
