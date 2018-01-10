class Usuario < ApplicationRecord
  belongs_to :negocio
  has_secure_password
  has_many :horarios

  validates :usuario, presence: { message: "no debe quedar en blanco" }, length: {minimum: 6, maximum: 50,too_short: "debe tener al menos 6 caracteres" },
  format: { with: /\A[a-z0-9]+\z/, message: "solo minusculas" },uniqueness: {message: "el nombre elegido ya existe, por favor elija otro"}

  validates :nombre, presence: { message: "no debe quedar en blanco" }, length: {minimum: 3, maximum: 50,too_short: "debe tener al menos 3 caracteres" },
  format: { with: /\A[a-z0-9]+\z/, message: "solo minusculas" }

  validates :password, presence: { message: "no debe quedar en blanco" }, length: { minimum: 6, too_short:"su contraseña es demasiado corta, debe tener 6 caracteres como minimo" }
	validates :password, confirmation: { case_sensitive: true, message: "contraseñas no coinciden" }


end
