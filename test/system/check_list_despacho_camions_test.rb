require "application_system_test_case"

class CheckListDespachoCamionsTest < ApplicationSystemTestCase
  setup do
    @check_list_despacho_camion = check_list_despacho_camions(:one)
  end

  test "visiting the index" do
    visit check_list_despacho_camions_url
    assert_selector "h1", text: "Check List Despacho Camions"
  end

  test "creating a Check list despacho camion" do
    visit check_list_despacho_camions_url
    click_on "New Check List Despacho Camion"

    check "Armado correcto del pallet" if @check_list_despacho_camion.armado_correcto_del_pallet
    fill_in "Cantidad", with: @check_list_despacho_camion.cantidad
    check "Cantidad de pallets o sacos" if @check_list_despacho_camion.cantidad_de_pallets_o_sacos
    fill_in "Comentarios", with: @check_list_despacho_camion.comentarios
    check "Correcto enfundado" if @check_list_despacho_camion.correcto_enfundado
    fill_in "Fecha", with: @check_list_despacho_camion.fecha
    fill_in "Inspector", with: @check_list_despacho_camion.inspector
    check "Limpieza del saco" if @check_list_despacho_camion.limpieza_del_saco
    fill_in "Patente", with: @check_list_despacho_camion.patente
    fill_in "Producto", with: @check_list_despacho_camion.producto
    check "Sacos rotos" if @check_list_despacho_camion.sacos_rotos
    check "Tipo de producto correcto" if @check_list_despacho_camion.tipo_de_producto_correcto
    click_on "Create Check list despacho camion"

    assert_text "Check list despacho camion was successfully created"
    click_on "Back"
  end

  test "updating a Check list despacho camion" do
    visit check_list_despacho_camions_url
    click_on "Edit", match: :first

    check "Armado correcto del pallet" if @check_list_despacho_camion.armado_correcto_del_pallet
    fill_in "Cantidad", with: @check_list_despacho_camion.cantidad
    check "Cantidad de pallets o sacos" if @check_list_despacho_camion.cantidad_de_pallets_o_sacos
    fill_in "Comentarios", with: @check_list_despacho_camion.comentarios
    check "Correcto enfundado" if @check_list_despacho_camion.correcto_enfundado
    fill_in "Fecha", with: @check_list_despacho_camion.fecha
    fill_in "Inspector", with: @check_list_despacho_camion.inspector
    check "Limpieza del saco" if @check_list_despacho_camion.limpieza_del_saco
    fill_in "Patente", with: @check_list_despacho_camion.patente
    fill_in "Producto", with: @check_list_despacho_camion.producto
    check "Sacos rotos" if @check_list_despacho_camion.sacos_rotos
    check "Tipo de producto correcto" if @check_list_despacho_camion.tipo_de_producto_correcto
    click_on "Update Check list despacho camion"

    assert_text "Check list despacho camion was successfully updated"
    click_on "Back"
  end

  test "destroying a Check list despacho camion" do
    visit check_list_despacho_camions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Check list despacho camion was successfully destroyed"
  end
end
