require "application_system_test_case"

class EvaluacionsTest < ApplicationSystemTestCase
  setup do
    @evaluacion = evaluacions(:one)
  end

  test "visiting the index" do
    visit evaluacions_url
    assert_selector "h1", text: "Evaluacions"
  end

  test "creating a Evaluacion" do
    visit evaluacions_url
    click_on "New Evaluacion"

    fill_in "Barrido", with: @evaluacion.barrido
    fill_in "Comentarios", with: @evaluacion.comentarios
    fill_in "Derrames", with: @evaluacion.derrames
    fill_in "Orden", with: @evaluacion.orden
    fill_in "Promedio", with: @evaluacion.promedio
    fill_in "Sector", with: @evaluacion.sector_id
    click_on "Create Evaluacion"

    assert_text "Evaluacion was successfully created"
    click_on "Back"
  end

  test "updating a Evaluacion" do
    visit evaluacions_url
    click_on "Edit", match: :first

    fill_in "Barrido", with: @evaluacion.barrido
    fill_in "Comentarios", with: @evaluacion.comentarios
    fill_in "Derrames", with: @evaluacion.derrames
    fill_in "Orden", with: @evaluacion.orden
    fill_in "Promedio", with: @evaluacion.promedio
    fill_in "Sector", with: @evaluacion.sector_id
    click_on "Update Evaluacion"

    assert_text "Evaluacion was successfully updated"
    click_on "Back"
  end

  test "destroying a Evaluacion" do
    visit evaluacions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Evaluacion was successfully destroyed"
  end
end
