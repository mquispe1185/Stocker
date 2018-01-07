require 'test_helper'

class CuentaClientesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cuenta_cliente = cuenta_clientes(:one)
  end

  test "should get index" do
    get cuenta_clientes_url
    assert_response :success
  end

  test "should get new" do
    get new_cuenta_cliente_url
    assert_response :success
  end

  test "should create cuenta_cliente" do
    assert_difference('CuentaCliente.count') do
      post cuenta_clientes_url, params: { cuenta_cliente: { cliente_id: @cuenta_cliente.cliente_id, monto_adeudado: @cuenta_cliente.monto_adeudado, observacion: @cuenta_cliente.observacion } }
    end

    assert_redirected_to cuenta_cliente_url(CuentaCliente.last)
  end

  test "should show cuenta_cliente" do
    get cuenta_cliente_url(@cuenta_cliente)
    assert_response :success
  end

  test "should get edit" do
    get edit_cuenta_cliente_url(@cuenta_cliente)
    assert_response :success
  end

  test "should update cuenta_cliente" do
    patch cuenta_cliente_url(@cuenta_cliente), params: { cuenta_cliente: { cliente_id: @cuenta_cliente.cliente_id, monto_adeudado: @cuenta_cliente.monto_adeudado, observacion: @cuenta_cliente.observacion } }
    assert_redirected_to cuenta_cliente_url(@cuenta_cliente)
  end

  test "should destroy cuenta_cliente" do
    assert_difference('CuentaCliente.count', -1) do
      delete cuenta_cliente_url(@cuenta_cliente)
    end

    assert_redirected_to cuenta_clientes_url
  end
end
