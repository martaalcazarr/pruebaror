class CreateMaintenances < ActiveRecord::Migration[7.0]
  def change
    create_table :maintenances do |t|
      t.string :motor_name
      t.date :date
      t.string :email
      t.references :motor, null: false, foreign_key: true
      t.references :maintenance_type, null: false, foreign_key: true
      t.references :city, null: false, foreign_key: true

      t.timestamps
    end

    create_table :maintenances_materials, id: false do |t|
      t.references :maintenance, null: false, foreign_key: true
      t.references :material, null: false, foreign_key: true
    end
  end
end
