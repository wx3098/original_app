class MedicalAppointmentsController < ApplicationController

    def play_audio
      respond_to do |format|
        format.json { render json: { message: 'success' } }
      end
    end
  
   def create
    @medical_appointment = MedicalAppointment.new(user_id: current_user.id, medical_department_id: params[:medical_department_id])   
    if @medical_appointment.save
      redirect_to mains_path
    end
  end

  def destroy
    @medical_appointment = MedicalAppointment.find(params[:id])
    @medical_appointment.destroy
    respond_to do |format|
      format.html { redirect_to hospitals_medical_department_path(@medical_appointment.medical_department)  }
      format.js { render json: { message: 'success' } }
    end
  end
end
  