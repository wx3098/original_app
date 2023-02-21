class HospitalsController < ApplicationController
    def show 
        @hospital = Hospital.find(params[:id])
        @medical_departments = @hospital.medical_departments
        render "hospitals/show"
      end
end
