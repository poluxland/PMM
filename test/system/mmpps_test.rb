require "application_system_test_case"

class MmppsTest < ApplicationSystemTestCase
  setup do
    @mmpp = mmpps(:one)
  end

  test "visiting the index" do
    visit mmpps_url
    assert_selector "h1", text: "Mmpps"
  end

  test "creating a Mmpp" do
    visit mmpps_url
    click_on "New Mmpp"

    fill_in "Densidad", with: @mmpp.densidad
    fill_in "Descripcion", with: @mmpp.descripcion
    fill_in "Nombre", with: @mmpp.nombre
    click_on "Create Mmpp"

    assert_text "Mmpp was successfully created"
    click_on "Back"
  end

  test "updating a Mmpp" do
    visit mmpps_url
    click_on "Edit", match: :first

    fill_in "Densidad", with: @mmpp.densidad
    fill_in "Descripcion", with: @mmpp.descripcion
    fill_in "Nombre", with: @mmpp.nombre
    click_on "Update Mmpp"

    assert_text "Mmpp was successfully updated"
    click_on "Back"
  end

  test "destroying a Mmpp" do
    visit mmpps_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mmpp was successfully destroyed"
  end
end
