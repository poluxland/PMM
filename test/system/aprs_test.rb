require "application_system_test_case"

class AprsTest < ApplicationSystemTestCase
  setup do
    @apr = aprs(:one)
  end

  test "visiting the index" do
    visit aprs_url
    assert_selector "h1", text: "Aprs"
  end

  test "creating a Apr" do
    visit aprs_url
    click_on "New Apr"

    fill_in "Año ingreso", with: @apr.año_ingreso
    fill_in "Cargo", with: @apr.cargo
    fill_in "Nombre", with: @apr.nombre
    fill_in "Otros", with: @apr.otros
    fill_in "Rut", with: @apr.rut
    click_on "Create Apr"

    assert_text "Apr was successfully created"
    click_on "Back"
  end

  test "updating a Apr" do
    visit aprs_url
    click_on "Edit", match: :first

    fill_in "Año ingreso", with: @apr.año_ingreso
    fill_in "Cargo", with: @apr.cargo
    fill_in "Nombre", with: @apr.nombre
    fill_in "Otros", with: @apr.otros
    fill_in "Rut", with: @apr.rut
    click_on "Update Apr"

    assert_text "Apr was successfully updated"
    click_on "Back"
  end

  test "destroying a Apr" do
    visit aprs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Apr was successfully destroyed"
  end
end
