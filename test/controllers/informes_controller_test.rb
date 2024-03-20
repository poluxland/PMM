require "test_helper"

class InformesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @informe = informes(:one)
  end

  test "should get index" do
    get informes_url
    assert_response :success
  end

  test "should get new" do
    get new_informe_url
    assert_response :success
  end

  test "should create informe" do
    assert_difference('Informe.count') do
      post informes_url, params: { informe: { big_bag_especial_con_peba: @informe.big_bag_especial_con_peba, big_bag_especial_sin_peba: @informe.big_bag_especial_sin_peba, big_bag_extra_con_peba: @informe.big_bag_extra_con_peba, big_bag_extra_sin_peba: @informe.big_bag_extra_sin_peba, bobinas_plastificado: @informe.bobinas_plastificado, envases_big_bag: @informe.envases_big_bag, envases_especial: @informe.envases_especial, envases_extra: @informe.envases_extra, especial_enfundado: @informe.especial_enfundado, especial_sin_funda: @informe.especial_sin_funda, especial_soluble: @informe.especial_soluble, extra_enfundado: @informe.extra_enfundado, extra_sin_funda: @informe.extra_sin_funda, extra_soluble: @informe.extra_soluble, fecha: @informe.fecha, inicio_produccion: @informe.inicio_produccion, observaciones: @informe.observaciones, pallets_buenos: @informe.pallets_buenos, produccion_especial: @informe.produccion_especial, produccion_extra: @informe.produccion_extra, termino_produccion: @informe.termino_produccion } }
    end

    assert_redirected_to informe_url(Informe.last)
  end

  test "should show informe" do
    get informe_url(@informe)
    assert_response :success
  end

  test "should get edit" do
    get edit_informe_url(@informe)
    assert_response :success
  end

  test "should update informe" do
    patch informe_url(@informe), params: { informe: { big_bag_especial_con_peba: @informe.big_bag_especial_con_peba, big_bag_especial_sin_peba: @informe.big_bag_especial_sin_peba, big_bag_extra_con_peba: @informe.big_bag_extra_con_peba, big_bag_extra_sin_peba: @informe.big_bag_extra_sin_peba, bobinas_plastificado: @informe.bobinas_plastificado, envases_big_bag: @informe.envases_big_bag, envases_especial: @informe.envases_especial, envases_extra: @informe.envases_extra, especial_enfundado: @informe.especial_enfundado, especial_sin_funda: @informe.especial_sin_funda, especial_soluble: @informe.especial_soluble, extra_enfundado: @informe.extra_enfundado, extra_sin_funda: @informe.extra_sin_funda, extra_soluble: @informe.extra_soluble, fecha: @informe.fecha, inicio_produccion: @informe.inicio_produccion, observaciones: @informe.observaciones, pallets_buenos: @informe.pallets_buenos, produccion_especial: @informe.produccion_especial, produccion_extra: @informe.produccion_extra, termino_produccion: @informe.termino_produccion } }
    assert_redirected_to informe_url(@informe)
  end

  test "should destroy informe" do
    assert_difference('Informe.count', -1) do
      delete informe_url(@informe)
    end

    assert_redirected_to informes_url
  end
end
