require 'test_helper'

class CierresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cierre = cierres(:one)
  end

  test "should get index" do
    get cierres_url
    assert_response :success
  end

  test "should get new" do
    get new_cierre_url
    assert_response :success
  end

  test "should create cierre" do
    assert_difference('Cierre.count') do
      post cierres_url, params: { cierre: { caja_id: @cierre.caja_id, estado: @cierre.estado, fecha: @cierre.fecha, hora_final: @cierre.hora_final, hora_inicial: @cierre.hora_inicial, monto_final: @cierre.monto_final, monto_inicial: @cierre.monto_inicial, negocio_id: @cierre.negocio_id, observacion: @cierre.observacion, rendido: @cierre.rendido, usuario_id: @cierre.usuario_id } }
    end

    assert_redirected_to cierre_url(Cierre.last)
  end

  test "should show cierre" do
    get cierre_url(@cierre)
    assert_response :success
  end

  test "should get edit" do
    get edit_cierre_url(@cierre)
    assert_response :success
  end

  test "should update cierre" do
    patch cierre_url(@cierre), params: { cierre: { caja_id: @cierre.caja_id, estado: @cierre.estado, fecha: @cierre.fecha, hora_final: @cierre.hora_final, hora_inicial: @cierre.hora_inicial, monto_final: @cierre.monto_final, monto_inicial: @cierre.monto_inicial, negocio_id: @cierre.negocio_id, observacion: @cierre.observacion, rendido: @cierre.rendido, usuario_id: @cierre.usuario_id } }
    assert_redirected_to cierre_url(@cierre)
  end

  test "should destroy cierre" do
    assert_difference('Cierre.count', -1) do
      delete cierre_url(@cierre)
    end

    assert_redirected_to cierres_url
  end
end
