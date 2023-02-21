class MainsController < ApplicationController
  def index
    @appoint_departments = current_user.medical_appointment_departments
  end
end
