class TopsController < ApplicationController
  
  def index

    # @hospitals = current_hospital.order(created_at: "DESC")
    
    if params[:hospital]&&params[:hospital][:name].present?
      @hospitals = Hospital.where('name LIKE ?', "%#{params[:hospital][:name]}%")
      @hospitals = Hospital.all.includes(:medical_departments)
      # @departments = MedicalDepartment.includes(:hospitals).where('name LIKE ?', "%#{params[:hospital][:name]}%")
      # @departments = MedicalDepartment.all.includes(:hospital)
      # @departments = MedicalDepartment.reflect_on_all_associations.map(:name)
      
    else
      @hospitals = Hospital.all
    end
  end
  
  # @departments = MedicalDepartment.where(hospital_id: :medical_department_id)
  
  private
  
  def hospital_params
    params.require(:hospital).permit(:name)
  end
end
