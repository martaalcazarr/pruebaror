class Maintenance < ApplicationRecord
  belongs_to :motor
  belongs_to :maintenance_type
  belongs_to :city
  has_and_belongs_to_many :materials

  belongs_to :motor
  before_save :set_motor_name

  private

  def set_motor_name
    self.motor_name = motor.name if motor.present?
  end
end
