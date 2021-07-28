require "test_helper"

class PuzolanasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @puzolana = puzolanas(:one)
  end

  test "should get index" do
    get puzolanas_url
    assert_response :success
  end

  test "should get new" do
    get new_puzolana_url
    assert_response :success
  end

  test "should create puzolana" do
    assert_difference('Puzolana.count') do
      post puzolanas_url, params: { puzolana: { C403BC02_Polines: @puzolana.C403BC02_Polines, C403BC02_alineamiento: @puzolana.C403BC02_alineamiento, C403BC02_fugas: @puzolana.C403BC02_fugas, C403BC02_tensado_cinta: @puzolana.C403BC02_tensado_cinta, C403BC03_Polines: @puzolana.C403BC03_Polines, C403BC03_alineamiento: @puzolana.C403BC03_alineamiento, C403BC03_fugas: @puzolana.C403BC03_fugas, C403BC03_tensado_cinta: @puzolana.C403BC03_tensado_cinta, C403BC04_Polines: @puzolana.C403BC04_Polines, C403BC04_alineamiento: @puzolana.C403BC04_alineamiento, C403BC04_fugas: @puzolana.C403BC04_fugas, C403BC04_tensado_cinta: @puzolana.C403BC04_tensado_cinta, C403BC05_Polines: @puzolana.C403BC05_Polines, C403BC05_alineamiento: @puzolana.C403BC05_alineamiento, C403BC05_fugas: @puzolana.C403BC05_fugas, C403BC05_tensado_cinta: @puzolana.C403BC05_tensado_cinta, C403BC06_alineamiento: @puzolana.C403BC06_alineamiento, C403BC06_fugas: @puzolana.C403BC06_fugas, C403BC06_polines: @puzolana.C403BC06_polines, C403BC06_tensado_cinta: @puzolana.C403BC06_tensado_cinta } }
    end

    assert_redirected_to puzolana_url(Puzolana.last)
  end

  test "should show puzolana" do
    get puzolana_url(@puzolana)
    assert_response :success
  end

  test "should get edit" do
    get edit_puzolana_url(@puzolana)
    assert_response :success
  end

  test "should update puzolana" do
    patch puzolana_url(@puzolana), params: { puzolana: { C403BC02_Polines: @puzolana.C403BC02_Polines, C403BC02_alineamiento: @puzolana.C403BC02_alineamiento, C403BC02_fugas: @puzolana.C403BC02_fugas, C403BC02_tensado_cinta: @puzolana.C403BC02_tensado_cinta, C403BC03_Polines: @puzolana.C403BC03_Polines, C403BC03_alineamiento: @puzolana.C403BC03_alineamiento, C403BC03_fugas: @puzolana.C403BC03_fugas, C403BC03_tensado_cinta: @puzolana.C403BC03_tensado_cinta, C403BC04_Polines: @puzolana.C403BC04_Polines, C403BC04_alineamiento: @puzolana.C403BC04_alineamiento, C403BC04_fugas: @puzolana.C403BC04_fugas, C403BC04_tensado_cinta: @puzolana.C403BC04_tensado_cinta, C403BC05_Polines: @puzolana.C403BC05_Polines, C403BC05_alineamiento: @puzolana.C403BC05_alineamiento, C403BC05_fugas: @puzolana.C403BC05_fugas, C403BC05_tensado_cinta: @puzolana.C403BC05_tensado_cinta, C403BC06_alineamiento: @puzolana.C403BC06_alineamiento, C403BC06_fugas: @puzolana.C403BC06_fugas, C403BC06_polines: @puzolana.C403BC06_polines, C403BC06_tensado_cinta: @puzolana.C403BC06_tensado_cinta } }
    assert_redirected_to puzolana_url(@puzolana)
  end

  test "should destroy puzolana" do
    assert_difference('Puzolana.count', -1) do
      delete puzolana_url(@puzolana)
    end

    assert_redirected_to puzolanas_url
  end
end
