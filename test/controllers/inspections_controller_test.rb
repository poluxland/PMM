require "test_helper"

class InspectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @inspection = inspections(:one)
  end

  test "should get index" do
    get inspections_url
    assert_response :success
  end

  test "should get new" do
    get new_inspection_url
    assert_response :success
  end

  test "should create inspection" do
    assert_difference('Inspection.count') do
      post inspections_url, params: { inspection: { area_id: @inspection.area_id, ast: @inspection.ast, comentarios: @inspection.comentarios, cumplimiento: @inspection.cumplimiento, epp: @inspection.epp, plant_id: @inspection.plant_id, pts: @inspection.pts, subsitio: @inspection.subsitio, supervisor_id: @inspection.supervisor_id, tarea_id: @inspection.tarea_id, trabajadores: @inspection.trabajadores } }
    end

    assert_redirected_to inspection_url(Inspection.last)
  end

  test "should show inspection" do
    get inspection_url(@inspection)
    assert_response :success
  end

  test "should get edit" do
    get edit_inspection_url(@inspection)
    assert_response :success
  end

  test "should update inspection" do
    patch inspection_url(@inspection), params: { inspection: { area_id: @inspection.area_id, ast: @inspection.ast, comentarios: @inspection.comentarios, cumplimiento: @inspection.cumplimiento, epp: @inspection.epp, plant_id: @inspection.plant_id, pts: @inspection.pts, subsitio: @inspection.subsitio, supervisor_id: @inspection.supervisor_id, tarea_id: @inspection.tarea_id, trabajadores: @inspection.trabajadores } }
    assert_redirected_to inspection_url(@inspection)
  end

  test "should destroy inspection" do
    assert_difference('Inspection.count', -1) do
      delete inspection_url(@inspection)
    end

    assert_redirected_to inspections_url
  end
end
