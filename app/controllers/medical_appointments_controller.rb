class MedicalAppointmentsController < ApplicationController

    def create
      @medical_appointment = MedicalAppointment.new(user_id: current_user.id, medical_department_id: params[:medical_department_id])   
      if @medical_appointment.save
        redirect_to mains_path
      end
        
    end
end
