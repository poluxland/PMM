require "test_helper"

class RecuperadosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recuperado = recuperados(:one)
  end

  test "should get index" do
    get recuperados_url
    assert_response :success
  end

  test "should get new" do
    get new_recuperado_url
    assert_response :success
  end

  test "should create recuperado" do
    assert_difference('Recuperado.count') do
      post recuperados_url, params: { recuperado: { Aire_terciario: @recuperado.Aire_terciario, Aux_H9: @recuperado.Aux_H9, CI08F01: @recuperado.CI08F01, Cintas_MP: @recuperado.Cintas_MP, Coke: @recuperado.Coke, EM21: @recuperado.EM21, EM22: @recuperado.EM22, Exterior_molinos_MP: @recuperado.Exterior_molinos_MP, Filtax: @recuperado.Filtax, Filtro_enfriadera: @recuperado.Filtro_enfriadera, Niagara: @recuperado.Niagara, Puzolana: @recuperado.Puzolana, Sepax: @recuperado.Sepax, Silo_KKI: @recuperado.Silo_KKI, Skako: @recuperado.Skako, Yeso: @recuperado.Yeso, cola_H9: @recuperado.cola_H9, comentarios: @recuperado.comentarios } }
    end

    assert_redirected_to recuperado_url(Recuperado.last)
  end

  test "should show recuperado" do
    get recuperado_url(@recuperado)
    assert_response :success
  end

  test "should get edit" do
    get edit_recuperado_url(@recuperado)
    assert_response :success
  end

  test "should update recuperado" do
    patch recuperado_url(@recuperado), params: { recuperado: { Aire_terciario: @recuperado.Aire_terciario, Aux_H9: @recuperado.Aux_H9, CI08F01: @recuperado.CI08F01, Cintas_MP: @recuperado.Cintas_MP, Coke: @recuperado.Coke, EM21: @recuperado.EM21, EM22: @recuperado.EM22, Exterior_molinos_MP: @recuperado.Exterior_molinos_MP, Filtax: @recuperado.Filtax, Filtro_enfriadera: @recuperado.Filtro_enfriadera, Niagara: @recuperado.Niagara, Puzolana: @recuperado.Puzolana, Sepax: @recuperado.Sepax, Silo_KKI: @recuperado.Silo_KKI, Skako: @recuperado.Skako, Yeso: @recuperado.Yeso, cola_H9: @recuperado.cola_H9, comentarios: @recuperado.comentarios } }
    assert_redirected_to recuperado_url(@recuperado)
  end

  test "should destroy recuperado" do
    assert_difference('Recuperado.count', -1) do
      delete recuperado_url(@recuperado)
    end

    assert_redirected_to recuperados_url
  end
end
