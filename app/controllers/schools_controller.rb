class SchoolsController < ApplicationController
  def show
    @school = School.find(params[:id])
  end

  def new
    @school_district = SchoolDistrict.find_by(id: params[:school_district_id])
    @school = School.new
  end

  def create
    @school = School.new(school_params)
    @school_district = SchoolDistrict.find_by(id: params[:school_district_id])
    @school.school_district_id = @school_district.id

    if @school.save
      flash[:notice] = "You have successfully added a school to your district."
      redirect_to school_district_school_path(@school_district, @school)
    else
      flash[:alert] = "Fill out the forms correctly."
      render :new
    end
  end

  def edit
    @school_district = SchoolDistrict.find_by(id: params[:school_district_id])
    @school = School.find(params[:id])
  end

  def update
    @school_district = SchoolDistrict.find_by(id: params[:school_district_id])
    @school = School.find(params[:id])

    if @school.update_attributes(school_params)
      flash[:notice] = "You have successfully updated this school."
      redirect_to school_district_school_path(@school_district, @school)
    else
      flash[:alert] = "Fill out the forms correctly."
      render :edit
    end
  end

  private

  def school_params
    params.require(:school).permit(:name, :website, :address, :city, :state,
      :zip_code, :school_type)
  end
end
