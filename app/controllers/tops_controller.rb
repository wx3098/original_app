class TopsController < ApplicationController
  
  def index
    if params[:hospital] && params[:hospital][:name].present?
      # @hospitals = Hospital.hospital(hospital_params).includes(:medical_departments)
      @hospitals = Hospital.where('name LIKE ?', "%#{params[:hospital][:name]}%").includes(:medical_departments)
    else 
      @hospitals = Hospital.all.includes(:medical_departments)
    end
    @medical_departments = MedicalDepartment.all
  end

#   private
  
#   def hospital_params
#     params.require(:hospital).permit(:name)
#   end
end
