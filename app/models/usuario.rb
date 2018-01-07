class Usuario < ApplicationRecord
  belongs_to :negocio
  has_secure_password
  has_many :horarios
end
