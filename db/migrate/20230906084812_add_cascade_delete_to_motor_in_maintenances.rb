class AddCascadeDeleteToMotorInMaintenances < ActiveRecord::Migration[7.0]
  def up
   
    execute <<-SQL
      ALTER TABLE maintenances
      ADD CONSTRAINT fk_rails_motor_id
      FOREIGN KEY (motor_id)
      REFERENCES motors(id)
      ON DELETE CASCADE;
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE maintenances
      DROP CONSTRAINT IF EXISTS fk_rails_motor_id;
    SQL
  end
end
