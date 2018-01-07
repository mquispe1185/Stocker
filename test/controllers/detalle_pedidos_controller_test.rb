require 'test_helper'

class DetallePedidosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @detalle_pedido = detalle_pedidos(:one)
  end

  test "should get index" do
    get detalle_pedidos_url
    assert_response :success
  end

  test "should get new" do
    get new_detalle_pedido_url
    assert_response :success
  end

  test "should create detalle_pedido" do
    assert_difference('DetallePedido.count') do
      post detalle_pedidos_url, params: { detalle_pedido: { cantidad: @detalle_pedido.cantidad, pedido_id: @detalle_pedido.pedido_id, producto_id: @detalle_pedido.producto_id } }
    end

    assert_redirected_to detalle_pedido_url(DetallePedido.last)
  end

  test "should show detalle_pedido" do
    get detalle_pedido_url(@detalle_pedido)
    assert_response :success
  end

  test "should get edit" do
    get edit_detalle_pedido_url(@detalle_pedido)
    assert_response :success
  end

  test "should update detalle_pedido" do
    patch detalle_pedido_url(@detalle_pedido), params: { detalle_pedido: { cantidad: @detalle_pedido.cantidad, pedido_id: @detalle_pedido.pedido_id, producto_id: @detalle_pedido.producto_id } }
    assert_redirected_to detalle_pedido_url(@detalle_pedido)
  end

  test "should destroy detalle_pedido" do
    assert_difference('DetallePedido.count', -1) do
      delete detalle_pedido_url(@detalle_pedido)
    end

    assert_redirected_to detalle_pedidos_url
  end
end
