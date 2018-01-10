require 'test_helper'

class DetalleCierresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @detalle_cierre = detalle_cierres(:one)
  end

  test "should get index" do
    get detalle_cierres_url
    assert_response :success
  end

  test "should get new" do
    get new_detalle_cierre_url
    assert_response :success
  end

  test "should create detalle_cierre" do
    assert_difference('DetalleCierre.count') do
      post detalle_cierres_url, params: { detalle_cierre: { cierre_id: @detalle_cierre.cierre_id, descripcion: @detalle_cierre.descripcion, monto: @detalle_cierre.monto } }
    end

    assert_redirected_to detalle_cierre_url(DetalleCierre.last)
  end

  test "should show detalle_cierre" do
    get detalle_cierre_url(@detalle_cierre)
    assert_response :success
  end

  test "should get edit" do
    get edit_detalle_cierre_url(@detalle_cierre)
    assert_response :success
  end

  test "should update detalle_cierre" do
    patch detalle_cierre_url(@detalle_cierre), params: { detalle_cierre: { cierre_id: @detalle_cierre.cierre_id, descripcion: @detalle_cierre.descripcion, monto: @detalle_cierre.monto } }
    assert_redirected_to detalle_cierre_url(@detalle_cierre)
  end

  test "should destroy detalle_cierre" do
    assert_difference('DetalleCierre.count', -1) do
      delete detalle_cierre_url(@detalle_cierre)
    end

    assert_redirected_to detalle_cierres_url
  end
end
