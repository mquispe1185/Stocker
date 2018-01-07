require 'test_helper'

class CuentaProveedorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cuenta_proveedor = cuenta_proveedores(:one)
  end

  test "should get index" do
    get cuenta_proveedores_url
    assert_response :success
  end

  test "should get new" do
    get new_cuenta_proveedor_url
    assert_response :success
  end

  test "should create cuenta_proveedor" do
    assert_difference('CuentaProveedor.count') do
      post cuenta_proveedores_url, params: { cuenta_proveedor: { monto_adeudado: @cuenta_proveedor.monto_adeudado, negocio_id: @cuenta_proveedor.negocio_id, observacion: @cuenta_proveedor.observacion, proveedor_id: @cuenta_proveedor.proveedor_id } }
    end

    assert_redirected_to cuenta_proveedor_url(CuentaProveedor.last)
  end

  test "should show cuenta_proveedor" do
    get cuenta_proveedor_url(@cuenta_proveedor)
    assert_response :success
  end

  test "should get edit" do
    get edit_cuenta_proveedor_url(@cuenta_proveedor)
    assert_response :success
  end

  test "should update cuenta_proveedor" do
    patch cuenta_proveedor_url(@cuenta_proveedor), params: { cuenta_proveedor: { monto_adeudado: @cuenta_proveedor.monto_adeudado, negocio_id: @cuenta_proveedor.negocio_id, observacion: @cuenta_proveedor.observacion, proveedor_id: @cuenta_proveedor.proveedor_id } }
    assert_redirected_to cuenta_proveedor_url(@cuenta_proveedor)
  end

  test "should destroy cuenta_proveedor" do
    assert_difference('CuentaProveedor.count', -1) do
      delete cuenta_proveedor_url(@cuenta_proveedor)
    end

    assert_redirected_to cuenta_proveedores_url
  end
end
