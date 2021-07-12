require "application_system_test_case"

class DerramesTest < ApplicationSystemTestCase
  setup do
    @derrame = derrames(:one)
  end

  test "visiting the index" do
    visit derrames_url
    assert_selector "h1", text: "Derrames"
  end

  test "creating a Derrame" do
    visit derrames_url
    click_on "New Derrame"

    fill_in "Aire terciario", with: @derrame.Aire_terciario
    fill_in "Aux h9", with: @derrame.Aux_H9
    fill_in "Ci08f01", with: @derrame.CI08F01
    fill_in "Cintas mp", with: @derrame.Cintas_MP
    fill_in "Coke", with: @derrame.Coke
    fill_in "Em21", with: @derrame.EM21
    fill_in "Em22", with: @derrame.EM22
    fill_in "Exterior molinos mp", with: @derrame.Exterior_molinos_MP
    fill_in "Filtax", with: @derrame.Filtax
    fill_in "Filtro enfriadera", with: @derrame.Filtro_enfriadera
    fill_in "Niagara", with: @derrame.Niagara
    fill_in "Puzolana", with: @derrame.Puzolana
    fill_in "Sepax", with: @derrame.Sepax
    fill_in "Silo kki", with: @derrame.Silo_KKI
    fill_in "Skako", with: @derrame.Skako
    fill_in "Yeso", with: @derrame.Yeso
    fill_in "Cola h9", with: @derrame.cola_H9
    fill_in "Comentarios", with: @derrame.comentarios
    click_on "Create Derrame"

    assert_text "Derrame was successfully created"
    click_on "Back"
  end

  test "updating a Derrame" do
    visit derrames_url
    click_on "Edit", match: :first

    fill_in "Aire terciario", with: @derrame.Aire_terciario
    fill_in "Aux h9", with: @derrame.Aux_H9
    fill_in "Ci08f01", with: @derrame.CI08F01
    fill_in "Cintas mp", with: @derrame.Cintas_MP
    fill_in "Coke", with: @derrame.Coke
    fill_in "Em21", with: @derrame.EM21
    fill_in "Em22", with: @derrame.EM22
    fill_in "Exterior molinos mp", with: @derrame.Exterior_molinos_MP
    fill_in "Filtax", with: @derrame.Filtax
    fill_in "Filtro enfriadera", with: @derrame.Filtro_enfriadera
    fill_in "Niagara", with: @derrame.Niagara
    fill_in "Puzolana", with: @derrame.Puzolana
    fill_in "Sepax", with: @derrame.Sepax
    fill_in "Silo kki", with: @derrame.Silo_KKI
    fill_in "Skako", with: @derrame.Skako
    fill_in "Yeso", with: @derrame.Yeso
    fill_in "Cola h9", with: @derrame.cola_H9
    fill_in "Comentarios", with: @derrame.comentarios
    click_on "Update Derrame"

    assert_text "Derrame was successfully updated"
    click_on "Back"
  end

  test "destroying a Derrame" do
    visit derrames_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Derrame was successfully destroyed"
  end
end
