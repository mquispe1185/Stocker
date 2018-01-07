class AddNegocioToCuentaCliente < ActiveRecord::Migration[5.0]
  def change
    add_reference :cuenta_clientes, :negocio, foreign_key: true
  end
end
