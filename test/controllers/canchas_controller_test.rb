require 'test_helper'

class CanchasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cancha = canchas(:one)
  end

  test "should get index" do
    get canchas_url
    assert_response :success
  end

  test "should get new" do
    get new_cancha_url
    assert_response :success
  end

  test "should create cancha" do
    assert_difference('Cancha.count') do
      post canchas_url, params: { cancha: { capacidad: @cancha.capacidad, descripcion: @cancha.descripcion, mmpp_id: @cancha.mmpp_id, nombre: @cancha.nombre, operativa: @cancha.operativa } }
    end

    assert_redirected_to cancha_url(Cancha.last)
  end

  test "should show cancha" do
    get cancha_url(@cancha)
    assert_response :success
  end

  test "should get edit" do
    get edit_cancha_url(@cancha)
    assert_response :success
  end

  test "should update cancha" do
    patch cancha_url(@cancha), params: { cancha: { capacidad: @cancha.capacidad, descripcion: @cancha.descripcion, mmpp_id: @cancha.mmpp_id, nombre: @cancha.nombre, operativa: @cancha.operativa } }
    assert_redirected_to cancha_url(@cancha)
  end

  test "should destroy cancha" do
    assert_difference('Cancha.count', -1) do
      delete cancha_url(@cancha)
    end

    assert_redirected_to canchas_url
  end
end
