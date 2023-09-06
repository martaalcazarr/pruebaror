class Motor < ApplicationRecord
  belongs_to :user
  belongs_to :equipment_type
  has_many :maintenances
end
