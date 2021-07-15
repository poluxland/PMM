require "application_system_test_case"

class InspectionsTest < ApplicationSystemTestCase
  setup do
    @inspection = inspections(:one)
  end

  test "visiting the index" do
    visit inspections_url
    assert_selector "h1", text: "Inspections"
  end

  test "creating a Inspection" do
    visit inspections_url
    click_on "New Inspection"

    fill_in "Area", with: @inspection.area_id
    check "Ast" if @inspection.ast
    fill_in "Comentarios", with: @inspection.comentarios
    fill_in "Cumplimiento", with: @inspection.cumplimiento
    check "Epp" if @inspection.epp
    fill_in "Plant", with: @inspection.plant_id
    check "Pts" if @inspection.pts
    check "Subsitio" if @inspection.subsitio
    fill_in "Supervisor", with: @inspection.supervisor_id
    fill_in "Tarea", with: @inspection.tarea_id
    fill_in "Trabajadores", with: @inspection.trabajadores
    click_on "Create Inspection"

    assert_text "Inspection was successfully created"
    click_on "Back"
  end

  test "updating a Inspection" do
    visit inspections_url
    click_on "Edit", match: :first

    fill_in "Area", with: @inspection.area_id
    check "Ast" if @inspection.ast
    fill_in "Comentarios", with: @inspection.comentarios
    fill_in "Cumplimiento", with: @inspection.cumplimiento
    check "Epp" if @inspection.epp
    fill_in "Plant", with: @inspection.plant_id
    check "Pts" if @inspection.pts
    check "Subsitio" if @inspection.subsitio
    fill_in "Supervisor", with: @inspection.supervisor_id
    fill_in "Tarea", with: @inspection.tarea_id
    fill_in "Trabajadores", with: @inspection.trabajadores
    click_on "Update Inspection"

    assert_text "Inspection was successfully updated"
    click_on "Back"
  end

  test "destroying a Inspection" do
    visit inspections_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Inspection was successfully destroyed"
  end
end
