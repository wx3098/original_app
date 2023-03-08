class MedicalAppointmentMailer < ApplicationMailer
  def send_notification(appointment)
    @appointment = appointment
    @user = @appointment.user
    @medical_department = @appointment.medical_department

    mail to: @user.email, subject: "診察室へお入り下さい" 
  end
end
