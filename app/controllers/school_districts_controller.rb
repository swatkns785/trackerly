class SchoolDistrictsController < ApplicationController
  def show
    @school_district = SchoolDistrict.find(params[:id])
  end

  def new
    @school_district = SchoolDistrict.new
    @states_array = %w(AK AL AR AZ CA CO CT DC DE FL GA HI IA ID IL IN KS KY LA
    MA MD ME MI MN MO MS MT NC ND NE NH NJ NM NV NY OH OK OR PA RI SC SD TN TX
    UT VA VT WA WI WV WY)
  end

  def create
    school_district = SchoolDistrict.new(school_district_params)
    school_district.user = current_user
    if school_district.save
      flash[:notice] = 'Successfully created new school district.'
      redirect_to school_district_path(school_district)
    else
      render :new
    end
  end

  private

  def school_district_params
    params.require(:school_district).permit(:name, :website, :address, :city,
      :state, :zip_code)
  end
end
