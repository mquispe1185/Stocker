require 'test_helper'

class DetalleVentasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @detalle_venta = detalle_ventas(:one)
  end

  test "should get index" do
    get detalle_ventas_url
    assert_response :success
  end

  test "should get new" do
    get new_detalle_venta_url
    assert_response :success
  end

  test "should create detalle_venta" do
    assert_difference('DetalleVenta.count') do
      post detalle_ventas_url, params: { detalle_venta: { cantidad: @detalle_venta.cantidad, modificador: @detalle_venta.modificador, producto_id: @detalle_venta.producto_id, subtotal: @detalle_venta.subtotal, venta_id: @detalle_venta.venta_id } }
    end

    assert_redirected_to detalle_venta_url(DetalleVenta.last)
  end

  test "should show detalle_venta" do
    get detalle_venta_url(@detalle_venta)
    assert_response :success
  end

  test "should get edit" do
    get edit_detalle_venta_url(@detalle_venta)
    assert_response :success
  end

  test "should update detalle_venta" do
    patch detalle_venta_url(@detalle_venta), params: { detalle_venta: { cantidad: @detalle_venta.cantidad, modificador: @detalle_venta.modificador, producto_id: @detalle_venta.producto_id, subtotal: @detalle_venta.subtotal, venta_id: @detalle_venta.venta_id } }
    assert_redirected_to detalle_venta_url(@detalle_venta)
  end

  test "should destroy detalle_venta" do
    assert_difference('DetalleVenta.count', -1) do
      delete detalle_venta_url(@detalle_venta)
    end

    assert_redirected_to detalle_ventas_url
  end
end
