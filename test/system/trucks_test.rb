# frozen_string_literal: true

require 'application_system_test_case'

class TrucksTest < ApplicationSystemTestCase
  setup do
    @truck = trucks(:one)
  end

  test 'visiting the index' do
    visit trucks_url
    assert_selector 'h1', text: 'Trucks'
  end

  test 'creating a Truck' do
    visit trucks_url
    click_on 'New Truck'

    fill_in 'Fecha', with: @truck.fecha
    fill_in 'Llamada', with: @truck.llamada
    fill_in 'Llegada', with: @truck.llegada
    fill_in 'Mmpp', with: @truck.mmpp_id
    fill_in 'Salida', with: @truck.salida
    fill_in 'Tipo', with: @truck.tipo
    click_on 'Create Truck'

    assert_text 'Truck was successfully created'
    click_on 'Back'
  end

  test 'updating a Truck' do
    visit trucks_url
    click_on 'Edit', match: :first

    fill_in 'Fecha', with: @truck.fecha
    fill_in 'Llamada', with: @truck.llamada
    fill_in 'Llegada', with: @truck.llegada
    fill_in 'Mmpp', with: @truck.mmpp_id
    fill_in 'Salida', with: @truck.salida
    fill_in 'Tipo', with: @truck.tipo
    click_on 'Update Truck'

    assert_text 'Truck was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Truck' do
    visit trucks_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Truck was successfully destroyed'
  end
end
