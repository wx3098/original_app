class AddNameTohospitals < ActiveRecord::Migration[6.0]
  def change
    add_column :hospitals, :name, :string
  end
end
