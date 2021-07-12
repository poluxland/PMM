require "test_helper"

class DerramesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @derrame = derrames(:one)
  end

  test "should get index" do
    get derrames_url
    assert_response :success
  end

  test "should get new" do
    get new_derrame_url
    assert_response :success
  end

  test "should create derrame" do
    assert_difference('Derrame.count') do
      post derrames_url, params: { derrame: { Aire_terciario: @derrame.Aire_terciario, Aux_H9: @derrame.Aux_H9, CI08F01: @derrame.CI08F01, Cintas_MP: @derrame.Cintas_MP, Coke: @derrame.Coke, EM21: @derrame.EM21, EM22: @derrame.EM22, Exterior_molinos_MP: @derrame.Exterior_molinos_MP, Filtax: @derrame.Filtax, Filtro_enfriadera: @derrame.Filtro_enfriadera, Niagara: @derrame.Niagara, Puzolana: @derrame.Puzolana, Sepax: @derrame.Sepax, Silo_KKI: @derrame.Silo_KKI, Skako: @derrame.Skako, Yeso: @derrame.Yeso, cola_H9: @derrame.cola_H9, comentarios: @derrame.comentarios } }
    end

    assert_redirected_to derrame_url(Derrame.last)
  end

  test "should show derrame" do
    get derrame_url(@derrame)
    assert_response :success
  end

  test "should get edit" do
    get edit_derrame_url(@derrame)
    assert_response :success
  end

  test "should update derrame" do
    patch derrame_url(@derrame), params: { derrame: { Aire_terciario: @derrame.Aire_terciario, Aux_H9: @derrame.Aux_H9, CI08F01: @derrame.CI08F01, Cintas_MP: @derrame.Cintas_MP, Coke: @derrame.Coke, EM21: @derrame.EM21, EM22: @derrame.EM22, Exterior_molinos_MP: @derrame.Exterior_molinos_MP, Filtax: @derrame.Filtax, Filtro_enfriadera: @derrame.Filtro_enfriadera, Niagara: @derrame.Niagara, Puzolana: @derrame.Puzolana, Sepax: @derrame.Sepax, Silo_KKI: @derrame.Silo_KKI, Skako: @derrame.Skako, Yeso: @derrame.Yeso, cola_H9: @derrame.cola_H9, comentarios: @derrame.comentarios } }
    assert_redirected_to derrame_url(@derrame)
  end

  test "should destroy derrame" do
    assert_difference('Derrame.count', -1) do
      delete derrame_url(@derrame)
    end

    assert_redirected_to derrames_url
  end
end
