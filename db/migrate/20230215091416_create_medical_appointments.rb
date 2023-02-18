class CreateMedicalAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :medical_appointments do |t|
      t.references :user, foreign_key: true
      t.references :medical_department, foreign_key: true

      t.timestamps
    end
  end
end
