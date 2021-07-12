require "test_helper"

class EstadoEdificiosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @estado_edificio = estado_edificios(:one)
  end

  test "should get index" do
    get estado_edificios_url
    assert_response :success
  end

  test "should get new" do
    get new_estado_edificio_url
    assert_response :success
  end

  test "should create estado_edificio" do
    assert_difference('EstadoEdificio.count') do
      post estado_edificios_url, params: { estado_edificio: { Area_202: @estado_edificio.Area_202, Basculas: @estado_edificio.Basculas, Bba_flux: @estado_edificio.Bba_flux, CI01CK01: @estado_edificio.CI01CK01, EM17: @estado_edificio.EM17, Em21: @estado_edificio.Em21, Em22: @estado_edificio.Em22, Em_18_19: @estado_edificio.Em_18_19, Enfriadera: @estado_edificio.Enfriadera, Kki: @estado_edificio.Kki, Kkm: @estado_edificio.Kkm, Niagara: @estado_edificio.Niagara, Patio_M22: @estado_edificio.Patio_M22, Puzolana: @estado_edificio.Puzolana, Secador: @estado_edificio.Secador, Silos_superiores: @estado_edificio.Silos_superiores, Taller_electrico: @estado_edificio.Taller_electrico, Techo_ccm_h9: @estado_edificio.Techo_ccm_h9, Trans_cemento: @estado_edificio.Trans_cemento, Yeso: @estado_edificio.Yeso, comentarios: @estado_edificio.comentarios } }
    end

    assert_redirected_to estado_edificio_url(EstadoEdificio.last)
  end

  test "should show estado_edificio" do
    get estado_edificio_url(@estado_edificio)
    assert_response :success
  end

  test "should get edit" do
    get edit_estado_edificio_url(@estado_edificio)
    assert_response :success
  end

  test "should update estado_edificio" do
    patch estado_edificio_url(@estado_edificio), params: { estado_edificio: { Area_202: @estado_edificio.Area_202, Basculas: @estado_edificio.Basculas, Bba_flux: @estado_edificio.Bba_flux, CI01CK01: @estado_edificio.CI01CK01, EM17: @estado_edificio.EM17, Em21: @estado_edificio.Em21, Em22: @estado_edificio.Em22, Em_18_19: @estado_edificio.Em_18_19, Enfriadera: @estado_edificio.Enfriadera, Kki: @estado_edificio.Kki, Kkm: @estado_edificio.Kkm, Niagara: @estado_edificio.Niagara, Patio_M22: @estado_edificio.Patio_M22, Puzolana: @estado_edificio.Puzolana, Secador: @estado_edificio.Secador, Silos_superiores: @estado_edificio.Silos_superiores, Taller_electrico: @estado_edificio.Taller_electrico, Techo_ccm_h9: @estado_edificio.Techo_ccm_h9, Trans_cemento: @estado_edificio.Trans_cemento, Yeso: @estado_edificio.Yeso, comentarios: @estado_edificio.comentarios } }
    assert_redirected_to estado_edificio_url(@estado_edificio)
  end

  test "should destroy estado_edificio" do
    assert_difference('EstadoEdificio.count', -1) do
      delete estado_edificio_url(@estado_edificio)
    end

    assert_redirected_to estado_edificios_url
  end
end
