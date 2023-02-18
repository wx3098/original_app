class MedicalDepartment < ApplicationRecord
    has_many :medical_appointments, dependent: :destroy
    has_many :medical_appointments_users, through: :medical_appointments, source: :user
    belongs_to :hospital

    validates :name, presence: true
end
