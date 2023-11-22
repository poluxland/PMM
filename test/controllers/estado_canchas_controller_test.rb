require "test_helper"

class EstadoCanchasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @estado_cancha = estado_canchas(:one)
  end

  test "should get index" do
    get estado_canchas_url
    assert_response :success
  end

  test "should get new" do
    get new_estado_cancha_url
    assert_response :success
  end

  test "should create estado_cancha" do
    assert_difference('EstadoCancha.count') do
      post estado_canchas_url, params: { estado_cancha: { cachinales: @estado_cancha.cachinales, caolin: @estado_cancha.caolin, ceniza: @estado_cancha.ceniza, conchuela: @estado_cancha.conchuela, fierro: @estado_cancha.fierro, observaciones: @estado_cancha.observaciones, puzolana: @estado_cancha.puzolana, quilimari: @estado_cancha.quilimari, san_pedro: @estado_cancha.san_pedro, tunga: @estado_cancha.tunga, yeso: @estado_cancha.yeso, ñilhue: @estado_cancha.ñilhue } }
    end

    assert_redirected_to estado_cancha_url(EstadoCancha.last)
  end

  test "should show estado_cancha" do
    get estado_cancha_url(@estado_cancha)
    assert_response :success
  end

  test "should get edit" do
    get edit_estado_cancha_url(@estado_cancha)
    assert_response :success
  end

  test "should update estado_cancha" do
    patch estado_cancha_url(@estado_cancha), params: { estado_cancha: { cachinales: @estado_cancha.cachinales, caolin: @estado_cancha.caolin, ceniza: @estado_cancha.ceniza, conchuela: @estado_cancha.conchuela, fierro: @estado_cancha.fierro, observaciones: @estado_cancha.observaciones, puzolana: @estado_cancha.puzolana, quilimari: @estado_cancha.quilimari, san_pedro: @estado_cancha.san_pedro, tunga: @estado_cancha.tunga, yeso: @estado_cancha.yeso, ñilhue: @estado_cancha.ñilhue } }
    assert_redirected_to estado_cancha_url(@estado_cancha)
  end

  test "should destroy estado_cancha" do
    assert_difference('EstadoCancha.count', -1) do
      delete estado_cancha_url(@estado_cancha)
    end

    assert_redirected_to estado_canchas_url
  end
end
