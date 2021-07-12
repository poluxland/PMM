require "application_system_test_case"

class EstadoEdificiosTest < ApplicationSystemTestCase
  setup do
    @estado_edificio = estado_edificios(:one)
  end

  test "visiting the index" do
    visit estado_edificios_url
    assert_selector "h1", text: "Estado Edificios"
  end

  test "creating a Estado edificio" do
    visit estado_edificios_url
    click_on "New Estado Edificio"

    fill_in "Area 202", with: @estado_edificio.Area_202
    fill_in "Basculas", with: @estado_edificio.Basculas
    fill_in "Bba flux", with: @estado_edificio.Bba_flux
    fill_in "Ci01ck01", with: @estado_edificio.CI01CK01
    fill_in "Em17", with: @estado_edificio.EM17
    fill_in "Em21", with: @estado_edificio.Em21
    fill_in "Em22", with: @estado_edificio.Em22
    fill_in "Em 18 19", with: @estado_edificio.Em_18_19
    fill_in "Enfriadera", with: @estado_edificio.Enfriadera
    fill_in "Kki", with: @estado_edificio.Kki
    fill_in "Kkm", with: @estado_edificio.Kkm
    fill_in "Niagara", with: @estado_edificio.Niagara
    fill_in "Patio m22", with: @estado_edificio.Patio_M22
    fill_in "Puzolana", with: @estado_edificio.Puzolana
    fill_in "Secador", with: @estado_edificio.Secador
    fill_in "Silos superiores", with: @estado_edificio.Silos_superiores
    fill_in "Taller electrico", with: @estado_edificio.Taller_electrico
    fill_in "Techo ccm h9", with: @estado_edificio.Techo_ccm_h9
    fill_in "Trans cemento", with: @estado_edificio.Trans_cemento
    fill_in "Yeso", with: @estado_edificio.Yeso
    fill_in "Comentarios", with: @estado_edificio.comentarios
    click_on "Create Estado edificio"

    assert_text "Estado edificio was successfully created"
    click_on "Back"
  end

  test "updating a Estado edificio" do
    visit estado_edificios_url
    click_on "Edit", match: :first

    fill_in "Area 202", with: @estado_edificio.Area_202
    fill_in "Basculas", with: @estado_edificio.Basculas
    fill_in "Bba flux", with: @estado_edificio.Bba_flux
    fill_in "Ci01ck01", with: @estado_edificio.CI01CK01
    fill_in "Em17", with: @estado_edificio.EM17
    fill_in "Em21", with: @estado_edificio.Em21
    fill_in "Em22", with: @estado_edificio.Em22
    fill_in "Em 18 19", with: @estado_edificio.Em_18_19
    fill_in "Enfriadera", with: @estado_edificio.Enfriadera
    fill_in "Kki", with: @estado_edificio.Kki
    fill_in "Kkm", with: @estado_edificio.Kkm
    fill_in "Niagara", with: @estado_edificio.Niagara
    fill_in "Patio m22", with: @estado_edificio.Patio_M22
    fill_in "Puzolana", with: @estado_edificio.Puzolana
    fill_in "Secador", with: @estado_edificio.Secador
    fill_in "Silos superiores", with: @estado_edificio.Silos_superiores
    fill_in "Taller electrico", with: @estado_edificio.Taller_electrico
    fill_in "Techo ccm h9", with: @estado_edificio.Techo_ccm_h9
    fill_in "Trans cemento", with: @estado_edificio.Trans_cemento
    fill_in "Yeso", with: @estado_edificio.Yeso
    fill_in "Comentarios", with: @estado_edificio.comentarios
    click_on "Update Estado edificio"

    assert_text "Estado edificio was successfully updated"
    click_on "Back"
  end

  test "destroying a Estado edificio" do
    visit estado_edificios_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Estado edificio was successfully destroyed"
  end
end
