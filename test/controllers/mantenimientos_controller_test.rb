require "test_helper"

class MantenimientosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mantenimiento = mantenimientos(:one)
  end

  test "should get index" do
    get mantenimientos_url
    assert_response :success
  end

  test "should get new" do
    get new_mantenimiento_url
    assert_response :success
  end

  test "should create mantenimiento" do
    assert_difference('Mantenimiento.count') do
      post mantenimientos_url, params: { mantenimiento: { area: @mantenimiento.area, clase: @mantenimiento.clase, departamento: @mantenimiento.departamento, estado: @mantenimiento.estado, fecha_ejecucion: @mantenimiento.fecha_ejecucion, fecha_programada: @mantenimiento.fecha_programada, observacion: @mantenimiento.observacion, tarea: @mantenimiento.tarea } }
    end

    assert_redirected_to mantenimiento_url(Mantenimiento.last)
  end

  test "should show mantenimiento" do
    get mantenimiento_url(@mantenimiento)
    assert_response :success
  end

  test "should get edit" do
    get edit_mantenimiento_url(@mantenimiento)
    assert_response :success
  end

  test "should update mantenimiento" do
    patch mantenimiento_url(@mantenimiento), params: { mantenimiento: { area: @mantenimiento.area, clase: @mantenimiento.clase, departamento: @mantenimiento.departamento, estado: @mantenimiento.estado, fecha_ejecucion: @mantenimiento.fecha_ejecucion, fecha_programada: @mantenimiento.fecha_programada, observacion: @mantenimiento.observacion, tarea: @mantenimiento.tarea } }
    assert_redirected_to mantenimiento_url(@mantenimiento)
  end

  test "should destroy mantenimiento" do
    assert_difference('Mantenimiento.count', -1) do
      delete mantenimiento_url(@mantenimiento)
    end

    assert_redirected_to mantenimientos_url
  end
end
