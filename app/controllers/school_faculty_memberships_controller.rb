class SchoolFacultyMembershipsController < ApplicationController
  def index
    @school_district = SchoolDistrict.find(params[:school_district_id])
  end

  def new
    @school_district = SchoolDistrict.find(params[:school_district_id])
    @schools = School.where(
      school_district_id: @school_district.id).map { |school| school.name }
    @district_members = SchoolDistrictMembership.where(
      school_district_id: @school_district.id)
    @faculty_memberships = SchoolFacultyMembership.new
  end

  def create
    @school_district = SchoolDistrict.find(params[:school_district_id])
    @schools = School.where(
      school_district_id: @school_district.id)
    @school_names = @schools.map { |school| school.name }
    @district_members = SchoolDistrictMembership.where(
      school_district_id: @school_district.id)
    @district_member_names = @district_members.map { |member| member.user.name }

    @schools.each do |school|
      @district_members.each do |district_member|
        if params[district_member.user.name] == school.name
          membership = SchoolFacultyMembership.find_or_initialize_by(
            school_district_membership_id: district_member.id)
          membership.school_id = @schools[@school_names.index(
            params[district_member.user.name])].id
          membership.save
        end
      end
    end
    flash[:notice] = "School faculty assignments are saved."
    redirect_to school_district_school_faculty_memberships_path(@school_district)
  end
end
