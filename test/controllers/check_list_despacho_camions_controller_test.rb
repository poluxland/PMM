require "test_helper"

class CheckListDespachoCamionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @check_list_despacho_camion = check_list_despacho_camions(:one)
  end

  test "should get index" do
    get check_list_despacho_camions_url
    assert_response :success
  end

  test "should get new" do
    get new_check_list_despacho_camion_url
    assert_response :success
  end

  test "should create check_list_despacho_camion" do
    assert_difference('CheckListDespachoCamion.count') do
      post check_list_despacho_camions_url, params: { check_list_despacho_camion: { armado_correcto_del_pallet: @check_list_despacho_camion.armado_correcto_del_pallet, cantidad: @check_list_despacho_camion.cantidad, cantidad_de_pallets_o_sacos: @check_list_despacho_camion.cantidad_de_pallets_o_sacos, comentarios: @check_list_despacho_camion.comentarios, correcto_enfundado: @check_list_despacho_camion.correcto_enfundado, fecha: @check_list_despacho_camion.fecha, inspector: @check_list_despacho_camion.inspector, limpieza_del_saco: @check_list_despacho_camion.limpieza_del_saco, patente: @check_list_despacho_camion.patente, producto: @check_list_despacho_camion.producto, sacos_rotos: @check_list_despacho_camion.sacos_rotos, tipo_de_producto_correcto: @check_list_despacho_camion.tipo_de_producto_correcto } }
    end

    assert_redirected_to check_list_despacho_camion_url(CheckListDespachoCamion.last)
  end

  test "should show check_list_despacho_camion" do
    get check_list_despacho_camion_url(@check_list_despacho_camion)
    assert_response :success
  end

  test "should get edit" do
    get edit_check_list_despacho_camion_url(@check_list_despacho_camion)
    assert_response :success
  end

  test "should update check_list_despacho_camion" do
    patch check_list_despacho_camion_url(@check_list_despacho_camion), params: { check_list_despacho_camion: { armado_correcto_del_pallet: @check_list_despacho_camion.armado_correcto_del_pallet, cantidad: @check_list_despacho_camion.cantidad, cantidad_de_pallets_o_sacos: @check_list_despacho_camion.cantidad_de_pallets_o_sacos, comentarios: @check_list_despacho_camion.comentarios, correcto_enfundado: @check_list_despacho_camion.correcto_enfundado, fecha: @check_list_despacho_camion.fecha, inspector: @check_list_despacho_camion.inspector, limpieza_del_saco: @check_list_despacho_camion.limpieza_del_saco, patente: @check_list_despacho_camion.patente, producto: @check_list_despacho_camion.producto, sacos_rotos: @check_list_despacho_camion.sacos_rotos, tipo_de_producto_correcto: @check_list_despacho_camion.tipo_de_producto_correcto } }
    assert_redirected_to check_list_despacho_camion_url(@check_list_despacho_camion)
  end

  test "should destroy check_list_despacho_camion" do
    assert_difference('CheckListDespachoCamion.count', -1) do
      delete check_list_despacho_camion_url(@check_list_despacho_camion)
    end

    assert_redirected_to check_list_despacho_camions_url
  end
end
