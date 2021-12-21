require "application_system_test_case"

class BarredorasTest < ApplicationSystemTestCase
  setup do
    @barredora = barredoras(:one)
  end

  test "visiting the index" do
    visit barredoras_url
    assert_selector "h1", text: "Barredoras"
  end

  test "creating a Barredora" do
    visit barredoras_url
    click_on "New Barredora"

    fill_in "A202", with: @barredora.a202
    fill_in "Cal", with: @barredora.cal
    fill_in "Circunvalacion", with: @barredora.circunvalacion
    fill_in "Coke", with: @barredora.coke
    fill_in "Comentarios", with: @barredora.comentarios
    fill_in "J09", with: @barredora.j09
    fill_in "M21 m22", with: @barredora.m21_m22
    fill_in "Mmpp", with: @barredora.mmpp
    fill_in "Patio h9", with: @barredora.patio_h9
    fill_in "San diego", with: @barredora.san_diego
    click_on "Create Barredora"

    assert_text "Barredora was successfully created"
    click_on "Back"
  end

  test "updating a Barredora" do
    visit barredoras_url
    click_on "Edit", match: :first

    fill_in "A202", with: @barredora.a202
    fill_in "Cal", with: @barredora.cal
    fill_in "Circunvalacion", with: @barredora.circunvalacion
    fill_in "Coke", with: @barredora.coke
    fill_in "Comentarios", with: @barredora.comentarios
    fill_in "J09", with: @barredora.j09
    fill_in "M21 m22", with: @barredora.m21_m22
    fill_in "Mmpp", with: @barredora.mmpp
    fill_in "Patio h9", with: @barredora.patio_h9
    fill_in "San diego", with: @barredora.san_diego
    click_on "Update Barredora"

    assert_text "Barredora was successfully updated"
    click_on "Back"
  end

  test "destroying a Barredora" do
    visit barredoras_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Barredora was successfully destroyed"
  end
end
