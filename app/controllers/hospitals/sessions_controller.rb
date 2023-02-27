# frozen_string_literal: true

class Hospitals::SessionsController < Devise::SessionsController
  # before_action :authenticate_user!, except: [:new, :create, :new_guest]
  # before_action :configure_sign_in_params, only: [:create]

  def new_guest
    hospital = Hospital.guest
    sign_in hospital
    MedicalDepartment.find_or_create_by!(name: "ゲスト" ) do |md|
      md.hospital_id = hospital.id 
      md.name = "ゲスト"
      md.wait_time = 10
    end
    # medical_department_id = hospital.medical_departments.ids.
    redirect_to hospitals_medical_department_path(hospital.medical_departments.first.id), notice: '病院用のゲストユーザーとしてログインしました。'
  end


  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  #   redirect_to medical_departments_path
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
