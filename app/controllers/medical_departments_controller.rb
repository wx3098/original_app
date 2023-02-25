class MedicalDepartmentsController < ApplicationController
    before_action :authenticate_user!, only:[:show]

    def index
      @medical_departments = current_hospital.medical_departments
    end

    def show
      @medical_department = MedicalDepartment.includes(:medical_appointments_users).find(params[:id])
      @hospital = @medical_department.hospital
      @departments = @hospital.medical_departments
      # @medical_department = current_user.medical_departments
    end
    
    private

    def medical_department_params
      params.require(:medical_department).permit(:name, :hospital_id).merge(wait_time: params[:wait_time].to_i)
    end
end
