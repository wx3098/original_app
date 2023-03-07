class TopsController < ApplicationController
  
  def index
    if current_user
    @favorite_hospital_ids = current_user.favorites.pluck(:hospital_id)
    @hospitals = Hospital.where(id: @favorite_hospital_ids).includes(:medical_departments)
    end

    if params[:hospital] && params[:hospital][:name].present?
      @hospitals = Hospital.where('name LIKE ?', "%#{params[:hospital][:name]}%").includes(:medical_departments)
    else
      @hospitals ||= Hospital.all.includes(:medical_departments) 
    end
  end

  # def index
  #   if params[:hospital] && params[:hospital][:name].present?
  #     # @hospitals = Hospital.hospital(hospital_params).includes(:medical_departments)
  #     @hospitals = Hospital.where('name LIKE ?', "%#{params[:hospital][:name]}%").includes(:medical_departments)
  #   else 
  #     @hospitals = Hospital.all.includes(:medical_departments)
  #   end
  #   @medical_departments = MedicalDepartment.all
  # end

#   private
  
#   def hospital_params
#     params.require(:hospital).permit(:name)
#   end
end
