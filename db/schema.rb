# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171231043703) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "usuario"
    t.string   "password_digest"
    t.string   "email"
    t.string   "nombre"
    t.string   "telefono"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["email"], name: "index_admins_on_email", unique: true, using: :btree
  end

  create_table "cajas", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "negocio_id"
    t.index ["negocio_id"], name: "index_cajas_on_negocio_id", using: :btree
  end

  create_table "categorias", force: :cascade do |t|
    t.string   "nombre"
    t.string   "tipo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "negocio_id"
    t.index ["negocio_id"], name: "index_categorias_on_negocio_id", using: :btree
  end

  create_table "cierres", force: :cascade do |t|
    t.integer  "usuario_id"
    t.time     "hora_inicial"
    t.time     "hora_final"
    t.decimal  "monto_inicial"
    t.decimal  "monto_final"
    t.boolean  "estado"
    t.boolean  "rendido"
    t.date     "fecha"
    t.string   "observacion"
    t.integer  "negocio_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["negocio_id"], name: "index_cierres_on_negocio_id", using: :btree
    t.index ["usuario_id"], name: "index_cierres_on_usuario_id", using: :btree
  end

  create_table "clientes", force: :cascade do |t|
    t.integer  "negocio_id"
    t.string   "nombre"
    t.string   "direccion"
    t.string   "telefono"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["negocio_id"], name: "index_clientes_on_negocio_id", using: :btree
  end

  create_table "cuenta_clientes", force: :cascade do |t|
    t.integer  "cliente_id"
    t.decimal  "monto_adeudado"
    t.string   "observacion"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "negocio_id"
    t.index ["cliente_id"], name: "index_cuenta_clientes_on_cliente_id", using: :btree
    t.index ["negocio_id"], name: "index_cuenta_clientes_on_negocio_id", using: :btree
  end

  create_table "cuenta_proveedores", force: :cascade do |t|
    t.integer  "proveedor_id"
    t.integer  "negocio_id"
    t.decimal  "monto_adeudado"
    t.string   "observacion"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.decimal  "monto_inicial"
    t.index ["negocio_id"], name: "index_cuenta_proveedores_on_negocio_id", using: :btree
    t.index ["proveedor_id"], name: "index_cuenta_proveedores_on_proveedor_id", using: :btree
  end

  create_table "detalle_clientes", force: :cascade do |t|
    t.integer  "cuenta_cliente_id"
    t.integer  "usuario_id"
    t.string   "detalle"
    t.decimal  "monto"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["cuenta_cliente_id"], name: "index_detalle_clientes_on_cuenta_cliente_id", using: :btree
    t.index ["usuario_id"], name: "index_detalle_clientes_on_usuario_id", using: :btree
  end

  create_table "detalle_pedidos", force: :cascade do |t|
    t.integer  "pedido_id"
    t.integer  "producto_id"
    t.decimal  "cantidad"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["pedido_id"], name: "index_detalle_pedidos_on_pedido_id", using: :btree
    t.index ["producto_id"], name: "index_detalle_pedidos_on_producto_id", using: :btree
  end

  create_table "detalle_ventas", force: :cascade do |t|
    t.integer  "producto_id"
    t.decimal  "cantidad"
    t.decimal  "modificador"
    t.string   "subtotal"
    t.integer  "venta_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["producto_id"], name: "index_detalle_ventas_on_producto_id", using: :btree
    t.index ["venta_id"], name: "index_detalle_ventas_on_venta_id", using: :btree
  end

  create_table "gastos", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "categoria_id"
    t.integer  "usuario_id"
    t.integer  "negocio_id"
    t.decimal  "monto"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.boolean  "rendido"
    t.integer  "cierre_id"
    t.index ["categoria_id"], name: "index_gastos_on_categoria_id", using: :btree
    t.index ["cierre_id"], name: "index_gastos_on_cierre_id", using: :btree
    t.index ["negocio_id"], name: "index_gastos_on_negocio_id", using: :btree
    t.index ["usuario_id"], name: "index_gastos_on_usuario_id", using: :btree
  end

  create_table "horarios", force: :cascade do |t|
    t.integer  "usuario_id"
    t.datetime "final"
    t.datetime "duracion"
    t.boolean  "cerrado",    default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "negocio_id"
    t.index ["negocio_id"], name: "index_horarios_on_negocio_id", using: :btree
    t.index ["usuario_id"], name: "index_horarios_on_usuario_id", using: :btree
  end

  create_table "negocios", force: :cascade do |t|
    t.string   "nombre"
    t.string   "direccion"
    t.string   "telefono"
    t.string   "cuit"
    t.date     "alta"
    t.date     "expiracion_licencia"
    t.boolean  "validado"
    t.integer  "admin_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["admin_id"], name: "index_negocios_on_admin_id", using: :btree
  end

  create_table "pago_clientes", force: :cascade do |t|
    t.integer  "cuenta_cliente_id"
    t.decimal  "monto"
    t.integer  "usuario_id"
    t.string   "observacion"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.boolean  "rendido",           default: false
    t.index ["cuenta_cliente_id"], name: "index_pago_clientes_on_cuenta_cliente_id", using: :btree
    t.index ["usuario_id"], name: "index_pago_clientes_on_usuario_id", using: :btree
  end

  create_table "pago_proveedores", force: :cascade do |t|
    t.integer  "cuenta_proveedor_id"
    t.decimal  "monto"
    t.integer  "usuario_id"
    t.string   "observacion"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.boolean  "rendido",             default: false
    t.index ["cuenta_proveedor_id"], name: "index_pago_proveedores_on_cuenta_proveedor_id", using: :btree
    t.index ["usuario_id"], name: "index_pago_proveedores_on_usuario_id", using: :btree
  end

  create_table "pedidos", force: :cascade do |t|
    t.integer  "usuario_id"
    t.integer  "proveedor_id"
    t.integer  "negocio_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.boolean  "realizado",    default: false
    t.boolean  "recibido",     default: false
    t.index ["negocio_id"], name: "index_pedidos_on_negocio_id", using: :btree
    t.index ["proveedor_id"], name: "index_pedidos_on_proveedor_id", using: :btree
    t.index ["usuario_id"], name: "index_pedidos_on_usuario_id", using: :btree
  end

  create_table "productos", force: :cascade do |t|
    t.string   "codigo"
    t.string   "descripcion"
    t.decimal  "stock"
    t.decimal  "minimo"
    t.string   "unidad"
    t.decimal  "precio"
    t.decimal  "costo"
    t.integer  "negocio_id"
    t.integer  "proveedor_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.datetime "vencimiento"
    t.index ["negocio_id"], name: "index_productos_on_negocio_id", using: :btree
    t.index ["proveedor_id"], name: "index_productos_on_proveedor_id", using: :btree
  end

  create_table "proveedors", force: :cascade do |t|
    t.string   "nombre"
    t.string   "telefono"
    t.string   "celular"
    t.string   "email"
    t.string   "domicilio"
    t.string   "descripcion"
    t.integer  "negocio_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["negocio_id"], name: "index_proveedors_on_negocio_id", using: :btree
  end

  create_table "tipo_pagos", force: :cascade do |t|
    t.string   "descripcion"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "negocio_id"
    t.decimal  "modificador", precision: 8, scale: 2
    t.index ["negocio_id"], name: "index_tipo_pagos_on_negocio_id", using: :btree
  end

  create_table "usuarios", force: :cascade do |t|
    t.string   "usuario"
    t.string   "password_digest"
    t.string   "nombre"
    t.integer  "negocio_id"
    t.string   "rol"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["negocio_id"], name: "index_usuarios_on_negocio_id", using: :btree
  end

  create_table "ventas", force: :cascade do |t|
    t.integer  "ticket"
    t.integer  "usuario_id"
    t.date     "fecha"
    t.decimal  "total"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "negocio_id"
    t.integer  "cierre_id"
    t.boolean  "estado"
    t.integer  "caja_id"
    t.integer  "tipo_pago_id"
    t.index ["caja_id"], name: "index_ventas_on_caja_id", using: :btree
    t.index ["cierre_id"], name: "index_ventas_on_cierre_id", using: :btree
    t.index ["negocio_id"], name: "index_ventas_on_negocio_id", using: :btree
    t.index ["tipo_pago_id"], name: "index_ventas_on_tipo_pago_id", using: :btree
    t.index ["usuario_id"], name: "index_ventas_on_usuario_id", using: :btree
  end

  add_foreign_key "cajas", "negocios"
  add_foreign_key "categorias", "negocios"
  add_foreign_key "cierres", "negocios"
  add_foreign_key "cierres", "usuarios"
  add_foreign_key "clientes", "negocios"
  add_foreign_key "cuenta_clientes", "clientes"
  add_foreign_key "cuenta_clientes", "negocios"
  add_foreign_key "cuenta_proveedores", "negocios"
  add_foreign_key "cuenta_proveedores", "proveedors"
  add_foreign_key "detalle_clientes", "cuenta_clientes"
  add_foreign_key "detalle_clientes", "usuarios"
  add_foreign_key "detalle_pedidos", "pedidos", on_delete: :cascade
  add_foreign_key "detalle_pedidos", "productos"
  add_foreign_key "detalle_ventas", "productos"
  add_foreign_key "detalle_ventas", "ventas"
  add_foreign_key "gastos", "categorias"
  add_foreign_key "gastos", "cierres"
  add_foreign_key "gastos", "negocios"
  add_foreign_key "gastos", "usuarios"
  add_foreign_key "horarios", "negocios"
  add_foreign_key "horarios", "usuarios"
  add_foreign_key "negocios", "admins"
  add_foreign_key "pago_clientes", "cuenta_clientes"
  add_foreign_key "pago_clientes", "usuarios"
  add_foreign_key "pago_proveedores", "cuenta_proveedores"
  add_foreign_key "pago_proveedores", "usuarios"
  add_foreign_key "pedidos", "negocios"
  add_foreign_key "pedidos", "proveedors"
  add_foreign_key "pedidos", "usuarios"
  add_foreign_key "productos", "negocios"
  add_foreign_key "productos", "proveedors"
  add_foreign_key "proveedors", "negocios"
  add_foreign_key "tipo_pagos", "negocios"
  add_foreign_key "usuarios", "negocios"
  add_foreign_key "ventas", "cajas"
  add_foreign_key "ventas", "cierres"
  add_foreign_key "ventas", "negocios"
  add_foreign_key "ventas", "tipo_pagos"
  add_foreign_key "ventas", "usuarios"
end
