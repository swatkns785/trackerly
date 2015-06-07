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
      redirect_to school_path(@school)
    else
      # flash[:alert] = Array.new
      # @school.errors.full_messages.each do |msg|
      #   flash[:alert] << msg
      # end
      # redirect_to new_school_district_school_path
      render :new
    end
  end

  private

  def school_params
    params.require(:school).permit(:name, :website, :address, :city, :state,
      :zip_code)
  end
end
