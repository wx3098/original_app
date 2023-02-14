class CreateMedicalDepartments < ActiveRecord::Migration[6.0]
  def change
    create_table :medical_departments do |t|
      t.integer :wait_time
      t.string :name

      t.timestamps
    end
  end
end
