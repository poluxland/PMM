require "application_system_test_case"

class RecuperadosTest < ApplicationSystemTestCase
  setup do
    @recuperado = recuperados(:one)
  end

  test "visiting the index" do
    visit recuperados_url
    assert_selector "h1", text: "Recuperados"
  end

  test "creating a Recuperado" do
    visit recuperados_url
    click_on "New Recuperado"

    fill_in "Aire terciario", with: @recuperado.Aire_terciario
    fill_in "Aux h9", with: @recuperado.Aux_H9
    fill_in "Ci08f01", with: @recuperado.CI08F01
    fill_in "Cintas mp", with: @recuperado.Cintas_MP
    fill_in "Coke", with: @recuperado.Coke
    fill_in "Em21", with: @recuperado.EM21
    fill_in "Em22", with: @recuperado.EM22
    fill_in "Exterior molinos mp", with: @recuperado.Exterior_molinos_MP
    fill_in "Filtax", with: @recuperado.Filtax
    fill_in "Filtro enfriadera", with: @recuperado.Filtro_enfriadera
    fill_in "Niagara", with: @recuperado.Niagara
    fill_in "Puzolana", with: @recuperado.Puzolana
    fill_in "Sepax", with: @recuperado.Sepax
    fill_in "Silo kki", with: @recuperado.Silo_KKI
    fill_in "Skako", with: @recuperado.Skako
    fill_in "Yeso", with: @recuperado.Yeso
    fill_in "Cola h9", with: @recuperado.cola_H9
    fill_in "Comentarios", with: @recuperado.comentarios
    click_on "Create Recuperado"

    assert_text "Recuperado was successfully created"
    click_on "Back"
  end

  test "updating a Recuperado" do
    visit recuperados_url
    click_on "Edit", match: :first

    fill_in "Aire terciario", with: @recuperado.Aire_terciario
    fill_in "Aux h9", with: @recuperado.Aux_H9
    fill_in "Ci08f01", with: @recuperado.CI08F01
    fill_in "Cintas mp", with: @recuperado.Cintas_MP
    fill_in "Coke", with: @recuperado.Coke
    fill_in "Em21", with: @recuperado.EM21
    fill_in "Em22", with: @recuperado.EM22
    fill_in "Exterior molinos mp", with: @recuperado.Exterior_molinos_MP
    fill_in "Filtax", with: @recuperado.Filtax
    fill_in "Filtro enfriadera", with: @recuperado.Filtro_enfriadera
    fill_in "Niagara", with: @recuperado.Niagara
    fill_in "Puzolana", with: @recuperado.Puzolana
    fill_in "Sepax", with: @recuperado.Sepax
    fill_in "Silo kki", with: @recuperado.Silo_KKI
    fill_in "Skako", with: @recuperado.Skako
    fill_in "Yeso", with: @recuperado.Yeso
    fill_in "Cola h9", with: @recuperado.cola_H9
    fill_in "Comentarios", with: @recuperado.comentarios
    click_on "Update Recuperado"

    assert_text "Recuperado was successfully updated"
    click_on "Back"
  end

  test "destroying a Recuperado" do
    visit recuperados_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Recuperado was successfully destroyed"
  end
end
