class Negocio < ApplicationRecord
  belongs_to :admin
  has_many :usuarios
  has_many :cierres
  has_many :ventas
  has_many :gastos
  has_many :categorias
  has_many :productos
  has_many :ventas
  has_many :proveedors
  has_many :cuenta_proveedors
  has_many :pago_proveedores
  has_many :clientes
  has_many :cuenta_clientes
  has_many :pedidos
  has_many :horarios
  has_many :cajas
  has_many :tipo_pagos

end
