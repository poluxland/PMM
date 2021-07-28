require "test_helper"

class EnvasadorasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @envasadora = envasadoras(:one)
  end

  test "should get index" do
    get envasadoras_url
    assert_response :success
  end

  test "should get new" do
    get new_envasadora_url
    assert_response :success
  end

  test "should create envasadora" do
    assert_difference('Envasadora.count') do
      post envasadoras_url, params: { envasadora: { bba_fuller: @envasadora.bba_fuller, bodega_bb: @envasadora.bodega_bb, calle_servicio: @envasadora.calle_servicio, carga_ventomatic: @envasadora.carga_ventomatic, comentarios: @envasadora.comentarios, costado: @envasadora.costado, edificio_haver: @envasadora.edificio_haver, edificio_ventomatic: @envasadora.edificio_ventomatic, exterior_bodega: @envasadora.exterior_bodega, llenado_bb: @envasadora.llenado_bb, palletizador_haver: @envasadora.palletizador_haver, recuperado_bb: @envasadora.recuperado_bb, sector_escombros: @envasadora.sector_escombros, silo_28: @envasadora.silo_28 } }
    end

    assert_redirected_to envasadora_url(Envasadora.last)
  end

  test "should show envasadora" do
    get envasadora_url(@envasadora)
    assert_response :success
  end

  test "should get edit" do
    get edit_envasadora_url(@envasadora)
    assert_response :success
  end

  test "should update envasadora" do
    patch envasadora_url(@envasadora), params: { envasadora: { bba_fuller: @envasadora.bba_fuller, bodega_bb: @envasadora.bodega_bb, calle_servicio: @envasadora.calle_servicio, carga_ventomatic: @envasadora.carga_ventomatic, comentarios: @envasadora.comentarios, costado: @envasadora.costado, edificio_haver: @envasadora.edificio_haver, edificio_ventomatic: @envasadora.edificio_ventomatic, exterior_bodega: @envasadora.exterior_bodega, llenado_bb: @envasadora.llenado_bb, palletizador_haver: @envasadora.palletizador_haver, recuperado_bb: @envasadora.recuperado_bb, sector_escombros: @envasadora.sector_escombros, silo_28: @envasadora.silo_28 } }
    assert_redirected_to envasadora_url(@envasadora)
  end

  test "should destroy envasadora" do
    assert_difference('Envasadora.count', -1) do
      delete envasadora_url(@envasadora)
    end

    assert_redirected_to envasadoras_url
  end
end
