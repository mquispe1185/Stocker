require 'test_helper'

class PagoClientesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pago_cliente = pago_clientes(:one)
  end

  test "should get index" do
    get pago_clientes_url
    assert_response :success
  end

  test "should get new" do
    get new_pago_cliente_url
    assert_response :success
  end

  test "should create pago_cliente" do
    assert_difference('PagoCliente.count') do
      post pago_clientes_url, params: { pago_cliente: { cuenta_cliente_id: @pago_cliente.cuenta_cliente_id, monto: @pago_cliente.monto, observacion: @pago_cliente.observacion, usuario_id: @pago_cliente.usuario_id } }
    end

    assert_redirected_to pago_cliente_url(PagoCliente.last)
  end

  test "should show pago_cliente" do
    get pago_cliente_url(@pago_cliente)
    assert_response :success
  end

  test "should get edit" do
    get edit_pago_cliente_url(@pago_cliente)
    assert_response :success
  end

  test "should update pago_cliente" do
    patch pago_cliente_url(@pago_cliente), params: { pago_cliente: { cuenta_cliente_id: @pago_cliente.cuenta_cliente_id, monto: @pago_cliente.monto, observacion: @pago_cliente.observacion, usuario_id: @pago_cliente.usuario_id } }
    assert_redirected_to pago_cliente_url(@pago_cliente)
  end

  test "should destroy pago_cliente" do
    assert_difference('PagoCliente.count', -1) do
      delete pago_cliente_url(@pago_cliente)
    end

    assert_redirected_to pago_clientes_url
  end
end
