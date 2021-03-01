# frozen_string_literal: true

require 'application_system_test_case'

class ChecklistsTest < ApplicationSystemTestCase
  setup do
    @checklist = checklists(:one)
  end

  test 'visiting the index' do
    visit checklists_url
    assert_selector 'h1', text: 'Checklists'
  end

  test 'creating a Checklist' do
    visit checklists_url
    click_on 'New Checklist'

    fill_in 'Aseos', with: @checklist.aseos
    fill_in 'Cinta', with: @checklist.cinta
    fill_in 'Comentarios', with: @checklist.comentarios
    fill_in 'Fecha', with: @checklist.fecha
    fill_in 'Filtro1', with: @checklist.filtro1
    fill_in 'Filtro2', with: @checklist.filtro2
    fill_in 'Fugas', with: @checklist.fugas
    fill_in 'Iluminacion', with: @checklist.iluminacion
    fill_in 'Lubricacion', with: @checklist.lubricacion
    fill_in 'Nivel', with: @checklist.nivel
    fill_in 'Nombre', with: @checklist.nombre
    fill_in 'Polvo', with: @checklist.polvo
    fill_in 'Presion', with: @checklist.presion
    fill_in 'Raspador', with: @checklist.raspador
    click_on 'Create Checklist'

    assert_text 'Checklist was successfully created'
    click_on 'Back'
  end

  test 'updating a Checklist' do
    visit checklists_url
    click_on 'Edit', match: :first

    fill_in 'Aseos', with: @checklist.aseos
    fill_in 'Cinta', with: @checklist.cinta
    fill_in 'Comentarios', with: @checklist.comentarios
    fill_in 'Fecha', with: @checklist.fecha
    fill_in 'Filtro1', with: @checklist.filtro1
    fill_in 'Filtro2', with: @checklist.filtro2
    fill_in 'Fugas', with: @checklist.fugas
    fill_in 'Iluminacion', with: @checklist.iluminacion
    fill_in 'Lubricacion', with: @checklist.lubricacion
    fill_in 'Nivel', with: @checklist.nivel
    fill_in 'Nombre', with: @checklist.nombre
    fill_in 'Polvo', with: @checklist.polvo
    fill_in 'Presion', with: @checklist.presion
    fill_in 'Raspador', with: @checklist.raspador
    click_on 'Update Checklist'

    assert_text 'Checklist was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Checklist' do
    visit checklists_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Checklist was successfully destroyed'
  end
end
