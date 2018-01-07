class Admin < ApplicationRecord
	before_save { self.email = email.downcase }

	validates :usuario, presence: { message: "no debe quedar en blanco" }, length: {minimum: 6, maximum: 50,too_short: "debe tener al menos 6 caracteres y solo minusculas" },
	format: { with: /\A[a-z0-9]+\z/, message: "solo minusculas" },uniqueness: {message: "el nombre elegido ya existe, por favor elija otro"}
		
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: { message: "no debe quedar en blanco" }, length: { maximum: 50 }, format: { with: VALID_EMAIL_REGEX, message: "el formato de mail es incorrecto debe ser ejemplo@mail.com" },uniqueness: { case_sensitive: false }

	validates :nombre, presence: { message: "por favor ingrese su nombre y apellido" }, length: { maximum: 57 }

	has_secure_password
	validates :password, presence: { message: "no debe quedar en blanco" }, length: { minimum: 6, too_short:"su contraseña es demasiado corta, debe tener 6 caracteres como minimo" }
	validates :password, confirmation: { case_sensitive: true, message: "contraseñas no coinciden" }

	has_many :negocios
end
