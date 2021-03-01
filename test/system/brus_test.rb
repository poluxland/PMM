# frozen_string_literal: true

require 'application_system_test_case'

class BrusTest < ApplicationSystemTestCase
  setup do
    @bru = brus(:one)
  end

  test 'visiting the index' do
    visit brus_url
    assert_selector 'h1', text: 'Brus'
  end

  test 'creating a Bru' do
    visit brus_url
    click_on 'New Bru'

    fill_in 'Comentarios', with: @bru.comentarios
    fill_in 'Fecha', with: @bru.fecha
    fill_in 'Ingreso', with: @bru.ingreso
    fill_in 'Mmpp', with: @bru.mmpp
    fill_in 'Numero', with: @bru.numero
    fill_in 'Patente', with: @bru.patente
    fill_in 'Salida', with: @bru.salida
    click_on 'Create Bru'

    assert_text 'Bru was successfully created'
    click_on 'Back'
  end

  test 'updating a Bru' do
    visit brus_url
    click_on 'Edit', match: :first

    fill_in 'Comentarios', with: @bru.comentarios
    fill_in 'Fecha', with: @bru.fecha
    fill_in 'Ingreso', with: @bru.ingreso
    fill_in 'Mmpp', with: @bru.mmpp
    fill_in 'Numero', with: @bru.numero
    fill_in 'Patente', with: @bru.patente
    fill_in 'Salida', with: @bru.salida
    click_on 'Update Bru'

    assert_text 'Bru was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Bru' do
    visit brus_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Bru was successfully destroyed'
  end
end
