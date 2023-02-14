class MedicalDepartmentsController < ApplicationController
    def index
        @medical_departments = MedicalDepartment.all
    end

    def new
        @medical_department = MedicalDepartment.new
    end

    def create
      @medical_department = MedicalDepartment.new(medical_department_params)
        if @medical_department.save            
        redirect_to medical_departments_path
       else
        render :new       
       end
    end

    def show
        @medical_department = MedicalDepartment.find(params[:id])
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
        @medical_department.destroy
    end

    private

    def medical_department_params
    params.require(:medical_department).permit(:wait_time, :name)
    end
end
