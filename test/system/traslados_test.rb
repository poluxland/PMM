require "application_system_test_case"

class TrasladosTest < ApplicationSystemTestCase
  setup do
    @traslado = traslados(:one)
  end

  test "visiting the index" do
    visit traslados_url
    assert_selector "h1", text: "Traslados"
  end

  test "creating a Traslado" do
    visit traslados_url
    click_on "New Traslado"

    fill_in "Centro de costo", with: @traslado.centro_de_costo
    fill_in "Comentario", with: @traslado.comentario
    fill_in "Estado", with: @traslado.estado
    fill_in "Lugar", with: @traslado.lugar
    fill_in "Observaciones", with: @traslado.observaciones
    fill_in "Valor", with: @traslado.valor
    click_on "Create Traslado"

    assert_text "Traslado was successfully created"
    click_on "Back"
  end

  test "updating a Traslado" do
    visit traslados_url
    click_on "Edit", match: :first

    fill_in "Centro de costo", with: @traslado.centro_de_costo
    fill_in "Comentario", with: @traslado.comentario
    fill_in "Estado", with: @traslado.estado
    fill_in "Lugar", with: @traslado.lugar
    fill_in "Observaciones", with: @traslado.observaciones
    fill_in "Valor", with: @traslado.valor
    click_on "Update Traslado"

    assert_text "Traslado was successfully updated"
    click_on "Back"
  end

  test "destroying a Traslado" do
    visit traslados_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Traslado was successfully destroyed"
  end
end
