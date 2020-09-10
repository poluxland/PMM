require 'test_helper'

class ChecklistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @checklist = checklists(:one)
  end

  test "should get index" do
    get checklists_url
    assert_response :success
  end

  test "should get new" do
    get new_checklist_url
    assert_response :success
  end

  test "should create checklist" do
    assert_difference('Checklist.count') do
      post checklists_url, params: { checklist: { aseos: @checklist.aseos, cinta: @checklist.cinta, comentarios: @checklist.comentarios, fecha: @checklist.fecha, filtro1: @checklist.filtro1, filtro2: @checklist.filtro2, fugas: @checklist.fugas, iluminacion: @checklist.iluminacion, lubricacion: @checklist.lubricacion, nivel: @checklist.nivel, nombre: @checklist.nombre, polvo: @checklist.polvo, presion: @checklist.presion, raspador: @checklist.raspador } }
    end

    assert_redirected_to checklist_url(Checklist.last)
  end

  test "should show checklist" do
    get checklist_url(@checklist)
    assert_response :success
  end

  test "should get edit" do
    get edit_checklist_url(@checklist)
    assert_response :success
  end

  test "should update checklist" do
    patch checklist_url(@checklist), params: { checklist: { aseos: @checklist.aseos, cinta: @checklist.cinta, comentarios: @checklist.comentarios, fecha: @checklist.fecha, filtro1: @checklist.filtro1, filtro2: @checklist.filtro2, fugas: @checklist.fugas, iluminacion: @checklist.iluminacion, lubricacion: @checklist.lubricacion, nivel: @checklist.nivel, nombre: @checklist.nombre, polvo: @checklist.polvo, presion: @checklist.presion, raspador: @checklist.raspador } }
    assert_redirected_to checklist_url(@checklist)
  end

  test "should destroy checklist" do
    assert_difference('Checklist.count', -1) do
      delete checklist_url(@checklist)
    end

    assert_redirected_to checklists_url
  end
end
