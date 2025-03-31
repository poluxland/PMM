require "test_helper"

class PtmtrucksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ptmtruck = ptmtrucks(:one)
  end

  test "should get index" do
    get ptmtrucks_url
    assert_response :success
  end

  test "should get new" do
    get new_ptmtruck_url
    assert_response :success
  end

  test "should create ptmtruck" do
    assert_difference('Ptmtruck.count') do
      post ptmtrucks_url, params: { ptmtruck: { causa: @ptmtruck.causa, ingreso: @ptmtruck.ingreso, mmpp: @ptmtruck.mmpp, otros: @ptmtruck.otros, patente: @ptmtruck.patente, salida: @ptmtruck.salida } }
    end

    assert_redirected_to ptmtruck_url(Ptmtruck.last)
  end

  test "should show ptmtruck" do
    get ptmtruck_url(@ptmtruck)
    assert_response :success
  end

  test "should get edit" do
    get edit_ptmtruck_url(@ptmtruck)
    assert_response :success
  end

  test "should update ptmtruck" do
    patch ptmtruck_url(@ptmtruck), params: { ptmtruck: { causa: @ptmtruck.causa, ingreso: @ptmtruck.ingreso, mmpp: @ptmtruck.mmpp, otros: @ptmtruck.otros, patente: @ptmtruck.patente, salida: @ptmtruck.salida } }
    assert_redirected_to ptmtruck_url(@ptmtruck)
  end

  test "should destroy ptmtruck" do
    assert_difference('Ptmtruck.count', -1) do
      delete ptmtruck_url(@ptmtruck)
    end

    assert_redirected_to ptmtrucks_url
  end
end
