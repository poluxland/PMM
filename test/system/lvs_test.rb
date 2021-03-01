# frozen_string_literal: true

require 'application_system_test_case'

class LvsTest < ApplicationSystemTestCase
  setup do
    @lv = lvs(:one)
  end

  test 'visiting the index' do
    visit lvs_url
    assert_selector 'h1', text: 'Lvs'
  end

  test 'creating a Lv' do
    visit lvs_url
    click_on 'New Lv'

    fill_in 'Altura', with: @lv.altura
    fill_in 'Eemm', with: @lv.eemm
    fill_in 'Izaje', with: @lv.izaje
    fill_in 'Lototo', with: @lv.lototo
    fill_in 'Obervado', with: @lv.obervado
    fill_in 'Observador', with: @lv.observador
    fill_in 'Proceso', with: @lv.proceso
    click_on 'Create Lv'

    assert_text 'Lv was successfully created'
    click_on 'Back'
  end

  test 'updating a Lv' do
    visit lvs_url
    click_on 'Edit', match: :first

    fill_in 'Altura', with: @lv.altura
    fill_in 'Eemm', with: @lv.eemm
    fill_in 'Izaje', with: @lv.izaje
    fill_in 'Lototo', with: @lv.lototo
    fill_in 'Obervado', with: @lv.obervado
    fill_in 'Observador', with: @lv.observador
    fill_in 'Proceso', with: @lv.proceso
    click_on 'Update Lv'

    assert_text 'Lv was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Lv' do
    visit lvs_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Lv was successfully destroyed'
  end
end
