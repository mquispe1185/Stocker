class Caja < ApplicationRecord
	belongs_to :negocio
	has_many :ventas
	attribute :total, :decimal

	validates :nombre, presence: { message: "no debe quedar en blanco" }, length: {minimum: 2, maximum: 50,too_short: "debe tener al menos 2 caracteres" }

	def ventas_total(fecha,id)
		#fecha = DateTime.now.strftime  "%Y/%m/%d"
      self.total = ventas.where(fecha: fecha).where(usuario_id: id).sum(:total)
  	end
end
