class Maintenance < ApplicationRecord
  belongs_to :motor
  belongs_to :maintenance_type
  belongs_to :city
  has_and_belongs_to_many :materials
end
