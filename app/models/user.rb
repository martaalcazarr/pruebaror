class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         enum role: { operador: 'operador', administrador: 'administrador' }, _default: 'operador'
  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    self.role ||= :operador
  end
  #   def operador?
  #     self.role == 'operador'
  #   end
         
  #   def administrador?
  #     self.role == 'administrador'
  #   end
end
