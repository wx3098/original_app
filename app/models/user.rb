class User < ApplicationRecord

  has_many :medical_appointments, dependent: :destroy
  has_many :medical_appointment_departments , through: :medical_appointments, source: :medical_department
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
