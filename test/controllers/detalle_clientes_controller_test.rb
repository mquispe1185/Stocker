require 'test_helper'

class DetalleClientesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @detalle_cliente = detalle_clientes(:one)
  end

  test "should get index" do
    get detalle_clientes_url
    assert_response :success
  end

  test "should get new" do
    get new_detalle_cliente_url
    assert_response :success
  end

  test "should create detalle_cliente" do
    assert_difference('DetalleCliente.count') do
      post detalle_clientes_url, params: { detalle_cliente: { cuenta_cliente_id: @detalle_cliente.cuenta_cliente_id, detalle: @detalle_cliente.detalle, monto: @detalle_cliente.monto, usuario_id: @detalle_cliente.usuario_id } }
    end

    assert_redirected_to detalle_cliente_url(DetalleCliente.last)
  end

  test "should show detalle_cliente" do
    get detalle_cliente_url(@detalle_cliente)
    assert_response :success
  end

  test "should get edit" do
    get edit_detalle_cliente_url(@detalle_cliente)
    assert_response :success
  end

  test "should update detalle_cliente" do
    patch detalle_cliente_url(@detalle_cliente), params: { detalle_cliente: { cuenta_cliente_id: @detalle_cliente.cuenta_cliente_id, detalle: @detalle_cliente.detalle, monto: @detalle_cliente.monto, usuario_id: @detalle_cliente.usuario_id } }
    assert_redirected_to detalle_cliente_url(@detalle_cliente)
  end

  test "should destroy detalle_cliente" do
    assert_difference('DetalleCliente.count', -1) do
      delete detalle_cliente_url(@detalle_cliente)
    end

    assert_redirected_to detalle_clientes_url
  end
end
