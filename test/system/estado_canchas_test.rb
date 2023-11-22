require "application_system_test_case"

class EstadoCanchasTest < ApplicationSystemTestCase
  setup do
    @estado_cancha = estado_canchas(:one)
  end

  test "visiting the index" do
    visit estado_canchas_url
    assert_selector "h1", text: "Estado Canchas"
  end

  test "creating a Estado cancha" do
    visit estado_canchas_url
    click_on "New Estado Cancha"

    fill_in "Cachinales", with: @estado_cancha.cachinales
    fill_in "Caolin", with: @estado_cancha.caolin
    fill_in "Ceniza", with: @estado_cancha.ceniza
    fill_in "Conchuela", with: @estado_cancha.conchuela
    fill_in "Fierro", with: @estado_cancha.fierro
    fill_in "Observaciones", with: @estado_cancha.observaciones
    fill_in "Puzolana", with: @estado_cancha.puzolana
    fill_in "Quilimari", with: @estado_cancha.quilimari
    fill_in "San pedro", with: @estado_cancha.san_pedro
    fill_in "Tunga", with: @estado_cancha.tunga
    fill_in "Yeso", with: @estado_cancha.yeso
    fill_in "ñilhue", with: @estado_cancha.ñilhue
    click_on "Create Estado cancha"

    assert_text "Estado cancha was successfully created"
    click_on "Back"
  end

  test "updating a Estado cancha" do
    visit estado_canchas_url
    click_on "Edit", match: :first

    fill_in "Cachinales", with: @estado_cancha.cachinales
    fill_in "Caolin", with: @estado_cancha.caolin
    fill_in "Ceniza", with: @estado_cancha.ceniza
    fill_in "Conchuela", with: @estado_cancha.conchuela
    fill_in "Fierro", with: @estado_cancha.fierro
    fill_in "Observaciones", with: @estado_cancha.observaciones
    fill_in "Puzolana", with: @estado_cancha.puzolana
    fill_in "Quilimari", with: @estado_cancha.quilimari
    fill_in "San pedro", with: @estado_cancha.san_pedro
    fill_in "Tunga", with: @estado_cancha.tunga
    fill_in "Yeso", with: @estado_cancha.yeso
    fill_in "ñilhue", with: @estado_cancha.ñilhue
    click_on "Update Estado cancha"

    assert_text "Estado cancha was successfully updated"
    click_on "Back"
  end

  test "destroying a Estado cancha" do
    visit estado_canchas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Estado cancha was successfully destroyed"
  end
end
