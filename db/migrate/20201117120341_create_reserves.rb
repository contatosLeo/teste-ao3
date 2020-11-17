class CreateReserves < ActiveRecord::Migration[6.0]
  def change
    create_table :reserves do |t|
      t.references :vehicle, null: false, index: true, foreign_key: true
      t.integer :document

      t.timestamps
    end
  end
end
