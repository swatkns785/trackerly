class SchoolDistrictsController < ApplicationController
  def index
    if params[:query]
      @school_districts = SchoolDistrict.search(params[:query])
    end
  end

  def show
    @school_district = SchoolDistrict.find(params[:id])
  end

  def new
    @school_district = SchoolDistrict.new
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

  def edit
    @school_district = SchoolDistrict.find(params[:id])
  end

  def update
    school_district = SchoolDistrict.find(params[:id])
    if school_district.update_attributes(school_district_params)
      flash[:notice] = 'You have successfully edited your school district.'
      redirect_to school_district_path(school_district)
    else
      render :edit
    end
  end

  private

  def school_district_params
    params.require(:school_district).permit(:name, :website, :address, :city,
      :state, :zip_code)
  end
end
