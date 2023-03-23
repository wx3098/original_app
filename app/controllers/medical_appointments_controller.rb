class MedicalAppointmentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  require 'line/bot'
  
  def create
    @medical_appointment = MedicalAppointment.new(user_id: current_user.id, medical_department_id: params[:medical_department_id])   
    if @medical_appointment.save
      flash[:notice] = '受付が完了しました'
      redirect_to mains_path
    end
  end

  # def destroy
  #   @appointment = MedicalAppointment.find_by(id: params[:id])
  
  #   unless @appointment.nil?
  #     if user_signed_in?
  #       if current_user.provider == "line"
  #         @user = @appointment.user
  #         @medical_department = @appointment.medical_department
  #         @hospital = @medical_department.hospital
         
  #         client = Line::Bot::Client.new do |config|
  #           config.channel_secret = ENV['LINE_CHANNEL_SECRET']
  #           config.channel_token = ENV['LINE_CHANNEL_TOKEN']
  #         end
  
  #         message = {
  #           type: 'text',
  #           text: "#{@appointment.user.name}様 #{@medical_department.hospital.name} #{@medical_department.name} お待たせしました。診察室へお入り下さい。"
  #         }
  
  #         response = client.push_message(@user.uid, message)
  #       elsif current_user.provider == "email"
  #         MedicalAppointmentMailer.send_notification(@appointment).deliver_now
  #       end
  #     end
      
  #     @appointment.destroy
  #     flash[:notice] = '呼び出しました'
  #   end
  
  #   redirect_to medical_departments_path
  # 
  
  def destroy
    @appointment = MedicalAppointment.find_by(id: params[:id])
  
    if user_signed_in?
      if current_user.email.present?
        # メールアドレスが登録されている場合
        MedicalAppointmentMailer.send_notification(@appointment).deliver_now
        flash[:notice] = '呼び出しました'
      else
        # メールアドレスが登録されていない場合
        @user = @appointment.user
        @medical_department = @appointment.medical_department
        @hospital = @medical_department.hospital
  
        client = Line::Bot::Client.new do |config|
          config.channel_secret = ENV['LINE_CHANNEL_SECRET']
          config.channel_token = ENV['LINE_CHANNEL_TOKEN']
        end
  
        message = {
          type: 'text',
          text: "#{appointment.user.name}様 #{medical_department.hospital.name} #{medical_department.name} お待たせしました。診察室へお入り下さい。"
        }
  
        response = client.push_message(@user.uid, message)
        flash[:notice] = '呼び出しました'
      end
    end
  
    redirect_to medical_appointments_path
  end
  
end

