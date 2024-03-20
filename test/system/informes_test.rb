require "application_system_test_case"

class InformesTest < ApplicationSystemTestCase
  setup do
    @informe = informes(:one)
  end

  test "visiting the index" do
    visit informes_url
    assert_selector "h1", text: "Informes"
  end

  test "creating a Informe" do
    visit informes_url
    click_on "New Informe"

    fill_in "Big bag especial con peba", with: @informe.big_bag_especial_con_peba
    fill_in "Big bag especial sin peba", with: @informe.big_bag_especial_sin_peba
    fill_in "Big bag extra con peba", with: @informe.big_bag_extra_con_peba
    fill_in "Big bag extra sin peba", with: @informe.big_bag_extra_sin_peba
    fill_in "Bobinas plastificado", with: @informe.bobinas_plastificado
    fill_in "Envases big bag", with: @informe.envases_big_bag
    fill_in "Envases especial", with: @informe.envases_especial
    fill_in "Envases extra", with: @informe.envases_extra
    fill_in "Especial enfundado", with: @informe.especial_enfundado
    fill_in "Especial sin funda", with: @informe.especial_sin_funda
    fill_in "Especial soluble", with: @informe.especial_soluble
    fill_in "Extra enfundado", with: @informe.extra_enfundado
    fill_in "Extra sin funda", with: @informe.extra_sin_funda
    fill_in "Extra soluble", with: @informe.extra_soluble
    fill_in "Fecha", with: @informe.fecha
    fill_in "Inicio produccion", with: @informe.inicio_produccion
    fill_in "Observaciones", with: @informe.observaciones
    fill_in "Pallets buenos", with: @informe.pallets_buenos
    fill_in "Produccion especial", with: @informe.produccion_especial
    fill_in "Produccion extra", with: @informe.produccion_extra
    fill_in "Termino produccion", with: @informe.termino_produccion
    click_on "Create Informe"

    assert_text "Informe was successfully created"
    click_on "Back"
  end

  test "updating a Informe" do
    visit informes_url
    click_on "Edit", match: :first

    fill_in "Big bag especial con peba", with: @informe.big_bag_especial_con_peba
    fill_in "Big bag especial sin peba", with: @informe.big_bag_especial_sin_peba
    fill_in "Big bag extra con peba", with: @informe.big_bag_extra_con_peba
    fill_in "Big bag extra sin peba", with: @informe.big_bag_extra_sin_peba
    fill_in "Bobinas plastificado", with: @informe.bobinas_plastificado
    fill_in "Envases big bag", with: @informe.envases_big_bag
    fill_in "Envases especial", with: @informe.envases_especial
    fill_in "Envases extra", with: @informe.envases_extra
    fill_in "Especial enfundado", with: @informe.especial_enfundado
    fill_in "Especial sin funda", with: @informe.especial_sin_funda
    fill_in "Especial soluble", with: @informe.especial_soluble
    fill_in "Extra enfundado", with: @informe.extra_enfundado
    fill_in "Extra sin funda", with: @informe.extra_sin_funda
    fill_in "Extra soluble", with: @informe.extra_soluble
    fill_in "Fecha", with: @informe.fecha
    fill_in "Inicio produccion", with: @informe.inicio_produccion
    fill_in "Observaciones", with: @informe.observaciones
    fill_in "Pallets buenos", with: @informe.pallets_buenos
    fill_in "Produccion especial", with: @informe.produccion_especial
    fill_in "Produccion extra", with: @informe.produccion_extra
    fill_in "Termino produccion", with: @informe.termino_produccion
    click_on "Update Informe"

    assert_text "Informe was successfully updated"
    click_on "Back"
  end

  test "destroying a Informe" do
    visit informes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Informe was successfully destroyed"
  end
end
