class AddUidToMedicalAppointments < ActiveRecord::Migration[6.0]
  def change
    add_column :medical_appointments, :uid, :string
  end
end
