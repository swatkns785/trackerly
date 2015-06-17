class SchoolDepartmentsController < ApplicationController
  def new
    @school = School.find(params[:school_id])
    @school_department = SchoolDepartment.new
  end

  def create
    @school = School.find(params[:school_id])
    @school_department = SchoolDepartment.find_or_initialize_by(school_department_params)
    @school_department.school_id = @school.id
    if @school_department.save
      flash[:notice] = "School department(s) saved."
      redirect_to school_district_school_path(@school.school_district, @school)
    else
      flash[:alert] = "Unable to save."
      render :new
    end
  end

  private

  def school_department_params
    params.require(:school_department).permit(:name, :school_id)
  end
end
