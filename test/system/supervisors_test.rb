require "application_system_test_case"

class SupervisorsTest < ApplicationSystemTestCase
  setup do
    @supervisor = supervisors(:one)
  end

  test "visiting the index" do
    visit supervisors_url
    assert_selector "h1", text: "Supervisors"
  end

  test "creating a Supervisor" do
    visit supervisors_url
    click_on "New Supervisor"

    fill_in "Año ingreso", with: @supervisor.año_ingreso
    fill_in "Cargo", with: @supervisor.cargo
    fill_in "Nombre", with: @supervisor.nombre
    fill_in "Otros", with: @supervisor.otros
    fill_in "Rut", with: @supervisor.rut
    click_on "Create Supervisor"

    assert_text "Supervisor was successfully created"
    click_on "Back"
  end

  test "updating a Supervisor" do
    visit supervisors_url
    click_on "Edit", match: :first

    fill_in "Año ingreso", with: @supervisor.año_ingreso
    fill_in "Cargo", with: @supervisor.cargo
    fill_in "Nombre", with: @supervisor.nombre
    fill_in "Otros", with: @supervisor.otros
    fill_in "Rut", with: @supervisor.rut
    click_on "Update Supervisor"

    assert_text "Supervisor was successfully updated"
    click_on "Back"
  end

  test "destroying a Supervisor" do
    visit supervisors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Supervisor was successfully destroyed"
  end
end
