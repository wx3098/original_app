class MedicalAppointmentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  require 'line/bot'
  
  def create
    @medical_appointment = MedicalAppointment.new(user_id: current_user.id, medical_department_id: params[:medical_department_id])
    @medical_appointment.uid = current_user.uid
    if @medical_appointment.save
      flash[:notice] = '受付が完了しました'
      redirect_to mains_path
    end
  end

  
  def destroy
    @appointment = MedicalAppointment.find_by(id: params[:id])
  
    unless @appointment.nil?
      if current_user&.provider == "line"
        @user = @appointment.user
        @medical_department = @appointment.medical_department
        @hospital = @medical_department.hospital
  
        client = Line::Bot::Client.new do |config|
          config.channel_secret = ENV['LINE_CHANNEL_SECRET']
          config.channel_token = ENV['LINE_CHANNEL_TOKEN']
        end
  
        @medical_department.medical_appointments_users.each do |user|
          if user.uid == @user.uid
          message = {
            type: 'text',
            text: "#{user.name}様\n"\
                  "#{@medical_department.hospital.name}\n"\
                  "#{@medical_department.name}\n"\
                  "お待たせしました。診察室へお入り下さい。"
          }
  
          response = client.push_message(@user.uid, message)
        end
      end
    end
  
      if current_user&.email.present?
        MedicalAppointmentMailer.send_notification(@appointment).deliver_now
      end
  
      @appointment.destroy
      flash[:notice] = '呼び出しました'
    end
  
    redirect_to medical_departments_path
  end
end

