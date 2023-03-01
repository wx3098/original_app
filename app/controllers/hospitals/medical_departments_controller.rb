class Hospitals::MedicalDepartmentsController < ApplicationController
  before_action :authenticate_hospital!
  # before_action :set_medical_department, only: [:show, :edit, :update, :destroy]

  def index
    @medical_departments = current_hospital.medical_departments
  end

  def new
    @medical_department = MedicalDepartment.new
    @hospital = current_hospital
    # @medical_department = current_hospital.medical_departments.build
  end

  def create
    @medical_department = MedicalDepartment.new(medical_department_params)
    @medical_department.hospital_id = current_hospital.id
    if @medical_department.save            
      redirect_to medical_departments_path(@medical_department)
    else
      render :new       
    end
  end

  def show
      @medical_department = MedicalDepartment.find_by(id: params[:id])
      @hospital = @medical_department.hospital
      @departments = @hospital.medical_departments
      # @medical_department = current_user.medical_departments
  end

  def edit
    @medical_department = MedicalDepartment.find(params[:id]) 
  end

  def update
    @medical_department = MedicalDepartment.find(params[:id]) 
  
    if @medical_department.update(medical_department_params)
        redirect_to medical_departments_path, notice: "編集しました"
    else
        render :new
    end
  end

  def destroy
    @medical_department = MedicalDepartment.find(params[:id])    
    if @medical_department.destroy
        flash[:notice] = '削除しました'
        redirect_to medical_departments_path
    end
  end

  private

  def medical_department_params
   
    params.require(:medical_department).permit(:wait_time, :name, :hospital_id)
  end


  # def set_medical_department
  #   @medical_department = MedicalDepartment.find_by(id: params[:id])
  #   if @medical_department.nil?
  #     flash[:alert] = "該当する診療科が存在しません。"
  #     redirect_to home_path
  #   end
  # end
end

