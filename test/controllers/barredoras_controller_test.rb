require "test_helper"

class BarredorasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @barredora = barredoras(:one)
  end

  test "should get index" do
    get barredoras_url
    assert_response :success
  end

  test "should get new" do
    get new_barredora_url
    assert_response :success
  end

  test "should create barredora" do
    assert_difference('Barredora.count') do
      post barredoras_url, params: { barredora: { a202: @barredora.a202, cal: @barredora.cal, circunvalacion: @barredora.circunvalacion, coke: @barredora.coke, comentarios: @barredora.comentarios, j09: @barredora.j09, m21_m22: @barredora.m21_m22, mmpp: @barredora.mmpp, patio_h9: @barredora.patio_h9, san_diego: @barredora.san_diego } }
    end

    assert_redirected_to barredora_url(Barredora.last)
  end

  test "should show barredora" do
    get barredora_url(@barredora)
    assert_response :success
  end

  test "should get edit" do
    get edit_barredora_url(@barredora)
    assert_response :success
  end

  test "should update barredora" do
    patch barredora_url(@barredora), params: { barredora: { a202: @barredora.a202, cal: @barredora.cal, circunvalacion: @barredora.circunvalacion, coke: @barredora.coke, comentarios: @barredora.comentarios, j09: @barredora.j09, m21_m22: @barredora.m21_m22, mmpp: @barredora.mmpp, patio_h9: @barredora.patio_h9, san_diego: @barredora.san_diego } }
    assert_redirected_to barredora_url(@barredora)
  end

  test "should destroy barredora" do
    assert_difference('Barredora.count', -1) do
      delete barredora_url(@barredora)
    end

    assert_redirected_to barredoras_url
  end
end
