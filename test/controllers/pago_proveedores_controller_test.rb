require 'test_helper'

class PagoProveedoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pago_proveedore = pago_proveedores(:one)
  end

  test "should get index" do
    get pago_proveedores_url
    assert_response :success
  end

  test "should get new" do
    get new_pago_proveedore_url
    assert_response :success
  end

  test "should create pago_proveedore" do
    assert_difference('PagoProveedore.count') do
      post pago_proveedores_url, params: { pago_proveedore: { cuenta_proveedor_id: @pago_proveedore.cuenta_proveedor_id, monto: @pago_proveedore.monto, observacion: @pago_proveedore.observacion, usuario_id: @pago_proveedore.usuario_id } }
    end

    assert_redirected_to pago_proveedore_url(PagoProveedore.last)
  end

  test "should show pago_proveedore" do
    get pago_proveedore_url(@pago_proveedore)
    assert_response :success
  end

  test "should get edit" do
    get edit_pago_proveedore_url(@pago_proveedore)
    assert_response :success
  end

  test "should update pago_proveedore" do
    patch pago_proveedore_url(@pago_proveedore), params: { pago_proveedore: { cuenta_proveedor_id: @pago_proveedore.cuenta_proveedor_id, monto: @pago_proveedore.monto, observacion: @pago_proveedore.observacion, usuario_id: @pago_proveedore.usuario_id } }
    assert_redirected_to pago_proveedore_url(@pago_proveedore)
  end

  test "should destroy pago_proveedore" do
    assert_difference('PagoProveedore.count', -1) do
      delete pago_proveedore_url(@pago_proveedore)
    end

    assert_redirected_to pago_proveedores_url
  end
end
