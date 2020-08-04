require "application_system_test_case"

class CuasisTest < ApplicationSystemTestCase
  setup do
    @cuasi = cuasis(:one)
  end

  test "visiting the index" do
    visit cuasis_url
    assert_selector "h1", text: "Cuasis"
  end

  test "creating a Cuasi" do
    visit cuasis_url
    click_on "New Cuasi"

    fill_in "Accion", with: @cuasi.accion
    fill_in "Estado", with: @cuasi.estado
    fill_in "Fecha", with: @cuasi.fecha
    fill_in "Potencial", with: @cuasi.potencial
    fill_in "Reporta", with: @cuasi.reporta
    fill_in "Responsable", with: @cuasi.responsable
    fill_in "Sitio", with: @cuasi.sitio
    click_on "Create Cuasi"

    assert_text "Cuasi was successfully created"
    click_on "Back"
  end

  test "updating a Cuasi" do
    visit cuasis_url
    click_on "Edit", match: :first

    fill_in "Accion", with: @cuasi.accion
    fill_in "Estado", with: @cuasi.estado
    fill_in "Fecha", with: @cuasi.fecha
    fill_in "Potencial", with: @cuasi.potencial
    fill_in "Reporta", with: @cuasi.reporta
    fill_in "Responsable", with: @cuasi.responsable
    fill_in "Sitio", with: @cuasi.sitio
    click_on "Update Cuasi"

    assert_text "Cuasi was successfully updated"
    click_on "Back"
  end

  test "destroying a Cuasi" do
    visit cuasis_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cuasi was successfully destroyed"
  end
end
