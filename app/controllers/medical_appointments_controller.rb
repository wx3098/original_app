class MedicalAppointmentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  
  def create
    @medical_appointment = MedicalAppointment.new(user_id: current_user.id, medical_department_id: params[:medical_department_id])   
    if @medical_appointment.save
      flash[:notice] = '受付が完了しました'
      redirect_to mains_path
    end
  end

  def destroy
    @appointment = MedicalAppointment.find_by(id: params[:id])
    if @appointment.present?
    @appointment.destroy
    MedicalAppointmentMailer.send_notification(@appointment).deliver
    flash[:notice] = '呼び出しました'
    redirect_to medical_departments_path
    else
      redirect_to medical_departments_path
  end
end
  
  # def destroy
  #   @appointment = MedicalAppointment.find(params[:id])
  #   @appointment.destroy
  #   MedicalAppointmentMailer.send_notification(@appointment).deliver
  #   redirect_to hospitals_medical_department_path(@appointment.medical_department)
  # end
end

