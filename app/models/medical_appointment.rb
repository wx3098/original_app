class MedicalAppointment < ApplicationRecord
  belongs_to :user
  belongs_to :medical_department
end
