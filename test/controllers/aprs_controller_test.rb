require "test_helper"

class AprsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @apr = aprs(:one)
  end

  test "should get index" do
    get aprs_url
    assert_response :success
  end

  test "should get new" do
    get new_apr_url
    assert_response :success
  end

  test "should create apr" do
    assert_difference('Apr.count') do
      post aprs_url, params: { apr: { año_ingreso: @apr.año_ingreso, cargo: @apr.cargo, nombre: @apr.nombre, otros: @apr.otros, rut: @apr.rut } }
    end

    assert_redirected_to apr_url(Apr.last)
  end

  test "should show apr" do
    get apr_url(@apr)
    assert_response :success
  end

  test "should get edit" do
    get edit_apr_url(@apr)
    assert_response :success
  end

  test "should update apr" do
    patch apr_url(@apr), params: { apr: { año_ingreso: @apr.año_ingreso, cargo: @apr.cargo, nombre: @apr.nombre, otros: @apr.otros, rut: @apr.rut } }
    assert_redirected_to apr_url(@apr)
  end

  test "should destroy apr" do
    assert_difference('Apr.count', -1) do
      delete apr_url(@apr)
    end

    assert_redirected_to aprs_url
  end
end
