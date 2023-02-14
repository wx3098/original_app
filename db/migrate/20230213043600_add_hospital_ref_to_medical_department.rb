class AddHospitalRefToMedicalDepartment < ActiveRecord::Migration[6.0]
  def change
    add_reference :medical_departments, :hospital, foreign_key: true
  end
end
