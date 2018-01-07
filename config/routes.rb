Rails.application.routes.draw do

  #rutas de login admin
  get '/login_admin', to: 'session_admin#new'
  post '/login_admin', to: 'session_admin#create'
  delete '/logout_admin',  to: 'session_admin#destroy'
 

  #rutas de login usuario
  get '/crear_nueva_caja', to: 'session#crear_nueva_caja'
  get    '/login',   to: 'session#new'
  post   '/login',   to: 'session#create'
  delete '/logout',  to: 'session#destroy'


  resources :negocios do
      resources :tipo_pagos
      get '/horarios', to: 'horario#index'
      resources :usuarios
      resources :categorias
      resources :cajas
       resources :cierres
       get '/cierre_caja', to: 'cierres#cierre_caja_usuario'
       put '/realizar_cierre', to: 'cierres#realizar_cierre'
       get '/balances', to: 'cierres#balances'
       post '/buscar_balance', to: 'cierres#buscar_balance'
       get '/ventas_usuario', to: 'ventas#ventas_usuario'
       resources :ventas do 
        resources :detalle_ventas
        get :autocomplete_producto_descripcion, :on => :collection
       end 
      resources :gastos
      resources :productos
      resources :proveedors
      resources :cuenta_proveedors
      resources :pago_proveedores
      resources :clientes
      resources :cuenta_clientes do
        resources :detalle_clientes
        resources :pago_clientes
      end
      resources :pedidos do
        resources :detalle_pedidos
      end
      get '/buscar_stock', to: 'productos#buscar_stock'
      get '/lista_productos', to: 'pedidos#lista_productos'
      post '/filtrar_productos', to: 'pedidos#filtrar_productos'
       get '/historico_cierres', to: 'cierres#historico_cierres'
       post '/buscar_cierres', to: 'cierres#buscar_cierres'
       get '/historico_ventas', to: 'ventas#historico_ventas'
       post '/buscar_ventas', to: 'ventas#buscar_ventas'
       post '/buscar_gastos', to: 'gastos#buscar_gastos'
       post '/buscar_horarios', to: 'horario#buscar_horarios'
  end

  
  resources :admins

  root 'admins#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
