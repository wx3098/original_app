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
  #     @appointment.destroy
  #     if user_signed_in? && current_user.provider == "line"
  #       @user = @appointment.user
  #       @medical_department = @appointment.medical_department
  #       @hospital = @medical_department.hospital
  #       client = Line::Bot::Client.new { |config|
  #         config.channel_secret = ENV['LINE_CHANNEL_SECRET']
  #         config.channel_token = ENV['LINE_CHANNEL_TOKEN']
  #     }
  #     message = {
  #       type: 'text',
  #       text: "#{@user} #{@hospital.name} #{@appoint.medical_department.name} お待たせしました。診察室へお入り下さい。"
  #     } 
  #     response = client.push_message(current_user.uid, message)
  #   elsif user_signed_in? && current_user.provider == "email"
  #     MedicalAppointmentMailer.send_notification(@appointment).deliver
  #   end
  #     flash[:notice] = '呼び出しました'
  #   end
  #     redirect_to medical_departments_path
  # end

  def destroy
    @appointment = MedicalAppointment.find_by(id: params[:id])
  
    unless @appointment.nil?
      @appointment.destroy
  
      if user_signed_in?
        if current_user.provider == "line"
          @user = @appointment.user
          @medical_department = @appointment.medical_department
          @hospital = @medical_department.hospital
  
          client = Line::Bot::Client.new do |config|
            config.channel_secret = ENV['LINE_CHANNEL_SECRET']
            config.channel_token = ENV['LINE_CHANNEL_TOKEN']
          end
  
          message = {
            type: 'text',
            text: "#{@user} #{@hospital} #{@medical_department} お待たせしました。診察室へお入り下さい。"
          }
  
          response = client.push_message(current_user.uid, message)
        elsif current_user.provider == "email"
          MedicalAppointmentMailer.send_notification(@appointment).deliver_now
        end
      end
  
      flash[:notice] = '呼び出しました'
    end
  
    redirect_to medical_departments_path
  end
  
  def call_patient
    @appointment = MedicalAppointment.find_by(id: params[:id])
  
    if user_signed_in?
      if current_user.provider == "line"
        @user = @appointment.user
        @medical_department = @appointment.medical_department
        @hospital = @medical_department.hospital
  
        client = Line::Bot::Client.new do |config|
          config.channel_secret = ENV['LINE_CHANNEL_SECRET']
          config.channel_token = ENV['LINE_CHANNEL_TOKEN']
        end
  
        message = {
          type: 'text',
          text: "#{@user} #{@hospital} #{@medical_department} 呼び出し中です。"
        }
  
        response = client.push_message(current_user.uid, message)
      elsif current_user.provider == "email"
        MedicalAppointmentMailer.send_call_notification(@appointment).deliver_now
      end
    end
  
    flash[:notice] = '呼び出しました'
    redirect_to medical_departments_path
  end
  
end

