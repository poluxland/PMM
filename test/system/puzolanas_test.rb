require "application_system_test_case"

class PuzolanasTest < ApplicationSystemTestCase
  setup do
    @puzolana = puzolanas(:one)
  end

  test "visiting the index" do
    visit puzolanas_url
    assert_selector "h1", text: "Puzolanas"
  end

  test "creating a Puzolana" do
    visit puzolanas_url
    click_on "New Puzolana"

    fill_in "C403bc02 polines", with: @puzolana.C403BC02_Polines
    fill_in "C403bc02 alineamiento", with: @puzolana.C403BC02_alineamiento
    fill_in "C403bc02 fugas", with: @puzolana.C403BC02_fugas
    fill_in "C403bc02 tensado cinta", with: @puzolana.C403BC02_tensado_cinta
    fill_in "C403bc03 polines", with: @puzolana.C403BC03_Polines
    fill_in "C403bc03 alineamiento", with: @puzolana.C403BC03_alineamiento
    fill_in "C403bc03 fugas", with: @puzolana.C403BC03_fugas
    fill_in "C403bc03 tensado cinta", with: @puzolana.C403BC03_tensado_cinta
    fill_in "C403bc04 polines", with: @puzolana.C403BC04_Polines
    fill_in "C403bc04 alineamiento", with: @puzolana.C403BC04_alineamiento
    fill_in "C403bc04 fugas", with: @puzolana.C403BC04_fugas
    fill_in "C403bc04 tensado cinta", with: @puzolana.C403BC04_tensado_cinta
    fill_in "C403bc05 polines", with: @puzolana.C403BC05_Polines
    fill_in "C403bc05 alineamiento", with: @puzolana.C403BC05_alineamiento
    fill_in "C403bc05 fugas", with: @puzolana.C403BC05_fugas
    fill_in "C403bc05 tensado cinta", with: @puzolana.C403BC05_tensado_cinta
    fill_in "C403bc06 alineamiento", with: @puzolana.C403BC06_alineamiento
    fill_in "C403bc06 fugas", with: @puzolana.C403BC06_fugas
    fill_in "C403bc06 polines", with: @puzolana.C403BC06_polines
    fill_in "C403bc06 tensado cinta", with: @puzolana.C403BC06_tensado_cinta
    click_on "Create Puzolana"

    assert_text "Puzolana was successfully created"
    click_on "Back"
  end

  test "updating a Puzolana" do
    visit puzolanas_url
    click_on "Edit", match: :first

    fill_in "C403bc02 polines", with: @puzolana.C403BC02_Polines
    fill_in "C403bc02 alineamiento", with: @puzolana.C403BC02_alineamiento
    fill_in "C403bc02 fugas", with: @puzolana.C403BC02_fugas
    fill_in "C403bc02 tensado cinta", with: @puzolana.C403BC02_tensado_cinta
    fill_in "C403bc03 polines", with: @puzolana.C403BC03_Polines
    fill_in "C403bc03 alineamiento", with: @puzolana.C403BC03_alineamiento
    fill_in "C403bc03 fugas", with: @puzolana.C403BC03_fugas
    fill_in "C403bc03 tensado cinta", with: @puzolana.C403BC03_tensado_cinta
    fill_in "C403bc04 polines", with: @puzolana.C403BC04_Polines
    fill_in "C403bc04 alineamiento", with: @puzolana.C403BC04_alineamiento
    fill_in "C403bc04 fugas", with: @puzolana.C403BC04_fugas
    fill_in "C403bc04 tensado cinta", with: @puzolana.C403BC04_tensado_cinta
    fill_in "C403bc05 polines", with: @puzolana.C403BC05_Polines
    fill_in "C403bc05 alineamiento", with: @puzolana.C403BC05_alineamiento
    fill_in "C403bc05 fugas", with: @puzolana.C403BC05_fugas
    fill_in "C403bc05 tensado cinta", with: @puzolana.C403BC05_tensado_cinta
    fill_in "C403bc06 alineamiento", with: @puzolana.C403BC06_alineamiento
    fill_in "C403bc06 fugas", with: @puzolana.C403BC06_fugas
    fill_in "C403bc06 polines", with: @puzolana.C403BC06_polines
    fill_in "C403bc06 tensado cinta", with: @puzolana.C403BC06_tensado_cinta
    click_on "Update Puzolana"

    assert_text "Puzolana was successfully updated"
    click_on "Back"
  end

  test "destroying a Puzolana" do
    visit puzolanas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Puzolana was successfully destroyed"
  end
end
