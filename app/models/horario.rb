class Horario < ApplicationRecord
  belongs_to :usuario
  belongs_to :negocio
end
