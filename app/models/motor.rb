class Motor < ApplicationRecord
  paginates_per 10
  belongs_to :user
  belongs_to :equipment_type
  has_many :maintenances, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :photo, presence: true
  validate :valid_name_format

  private

  def valid_name_format
    # Verifica que el nombre del motor cumpla con el formato deseado
    unless name.match(/\A(REAC|TURBO)-\d+\z/)
      errors.add(:name, 'debe seguir el formato REAC-n o TURBO-n')
    end
  end
end
