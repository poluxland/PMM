require "application_system_test_case"

class PtmtrucksTest < ApplicationSystemTestCase
  setup do
    @ptmtruck = ptmtrucks(:one)
  end

  test "visiting the index" do
    visit ptmtrucks_url
    assert_selector "h1", text: "Ptmtrucks"
  end

  test "creating a Ptmtruck" do
    visit ptmtrucks_url
    click_on "New Ptmtruck"

    fill_in "Causa", with: @ptmtruck.causa
    fill_in "Ingreso", with: @ptmtruck.ingreso
    fill_in "Mmpp", with: @ptmtruck.mmpp
    fill_in "Otros", with: @ptmtruck.otros
    fill_in "Patente", with: @ptmtruck.patente
    fill_in "Salida", with: @ptmtruck.salida
    click_on "Create Ptmtruck"

    assert_text "Ptmtruck was successfully created"
    click_on "Back"
  end

  test "updating a Ptmtruck" do
    visit ptmtrucks_url
    click_on "Edit", match: :first

    fill_in "Causa", with: @ptmtruck.causa
    fill_in "Ingreso", with: @ptmtruck.ingreso
    fill_in "Mmpp", with: @ptmtruck.mmpp
    fill_in "Otros", with: @ptmtruck.otros
    fill_in "Patente", with: @ptmtruck.patente
    fill_in "Salida", with: @ptmtruck.salida
    click_on "Update Ptmtruck"

    assert_text "Ptmtruck was successfully updated"
    click_on "Back"
  end

  test "destroying a Ptmtruck" do
    visit ptmtrucks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ptmtruck was successfully destroyed"
  end
end
