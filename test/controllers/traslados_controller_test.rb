require "test_helper"

class TrasladosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @traslado = traslados(:one)
  end

  test "should get index" do
    get traslados_url
    assert_response :success
  end

  test "should get new" do
    get new_traslado_url
    assert_response :success
  end

  test "should create traslado" do
    assert_difference('Traslado.count') do
      post traslados_url, params: { traslado: { centro_de_costo: @traslado.centro_de_costo, comentario: @traslado.comentario, estado: @traslado.estado, lugar: @traslado.lugar, observaciones: @traslado.observaciones, valor: @traslado.valor } }
    end

    assert_redirected_to traslado_url(Traslado.last)
  end

  test "should show traslado" do
    get traslado_url(@traslado)
    assert_response :success
  end

  test "should get edit" do
    get edit_traslado_url(@traslado)
    assert_response :success
  end

  test "should update traslado" do
    patch traslado_url(@traslado), params: { traslado: { centro_de_costo: @traslado.centro_de_costo, comentario: @traslado.comentario, estado: @traslado.estado, lugar: @traslado.lugar, observaciones: @traslado.observaciones, valor: @traslado.valor } }
    assert_redirected_to traslado_url(@traslado)
  end

  test "should destroy traslado" do
    assert_difference('Traslado.count', -1) do
      delete traslado_url(@traslado)
    end

    assert_redirected_to traslados_url
  end
end
