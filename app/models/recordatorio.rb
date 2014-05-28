class Recordatorio < ActiveRecord::Base
  before_save :set_regresado_to_default
  belongs_to :user
  
  validates :user_id, presence: true
  validates :fecha_prestamo, presence: true
  validates :fecha_entrega, presence: false
  validates :contacto, presence: true, length: { maximum: 100 }
  validates :concepto, presence: true, length: { maximum: 100 }
  validates :detalle, presence: false
  validates :lat, presence: false
  validates :long, presence: false
  
  private
  # If regresado field comes nil => set as false
  def set_regresado_to_default
  end
end
