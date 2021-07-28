require "application_system_test_case"

class EnvasadorasTest < ApplicationSystemTestCase
  setup do
    @envasadora = envasadoras(:one)
  end

  test "visiting the index" do
    visit envasadoras_url
    assert_selector "h1", text: "Envasadoras"
  end

  test "creating a Envasadora" do
    visit envasadoras_url
    click_on "New Envasadora"

    fill_in "Bba fuller", with: @envasadora.bba_fuller
    fill_in "Bodega bb", with: @envasadora.bodega_bb
    fill_in "Calle servicio", with: @envasadora.calle_servicio
    fill_in "Carga ventomatic", with: @envasadora.carga_ventomatic
    fill_in "Comentarios", with: @envasadora.comentarios
    fill_in "Costado", with: @envasadora.costado
    fill_in "Edificio haver", with: @envasadora.edificio_haver
    fill_in "Edificio ventomatic", with: @envasadora.edificio_ventomatic
    fill_in "Exterior bodega", with: @envasadora.exterior_bodega
    fill_in "Llenado bb", with: @envasadora.llenado_bb
    fill_in "Palletizador haver", with: @envasadora.palletizador_haver
    fill_in "Recuperado bb", with: @envasadora.recuperado_bb
    fill_in "Sector escombros", with: @envasadora.sector_escombros
    fill_in "Silo 28", with: @envasadora.silo_28
    click_on "Create Envasadora"

    assert_text "Envasadora was successfully created"
    click_on "Back"
  end

  test "updating a Envasadora" do
    visit envasadoras_url
    click_on "Edit", match: :first

    fill_in "Bba fuller", with: @envasadora.bba_fuller
    fill_in "Bodega bb", with: @envasadora.bodega_bb
    fill_in "Calle servicio", with: @envasadora.calle_servicio
    fill_in "Carga ventomatic", with: @envasadora.carga_ventomatic
    fill_in "Comentarios", with: @envasadora.comentarios
    fill_in "Costado", with: @envasadora.costado
    fill_in "Edificio haver", with: @envasadora.edificio_haver
    fill_in "Edificio ventomatic", with: @envasadora.edificio_ventomatic
    fill_in "Exterior bodega", with: @envasadora.exterior_bodega
    fill_in "Llenado bb", with: @envasadora.llenado_bb
    fill_in "Palletizador haver", with: @envasadora.palletizador_haver
    fill_in "Recuperado bb", with: @envasadora.recuperado_bb
    fill_in "Sector escombros", with: @envasadora.sector_escombros
    fill_in "Silo 28", with: @envasadora.silo_28
    click_on "Update Envasadora"

    assert_text "Envasadora was successfully updated"
    click_on "Back"
  end

  test "destroying a Envasadora" do
    visit envasadoras_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Envasadora was successfully destroyed"
  end
end
