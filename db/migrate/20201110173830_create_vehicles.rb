class CreateVehicles < ActiveRecord::Migration[6.0]
  def change
    create_table :vehicles do |t|
      t.string :license_plate
      t.string :brand
      t.string :model
      t.integer :year_model
      t.integer :year_manufacture

      t.timestamps
    end
  end
end
