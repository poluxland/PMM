# frozen_string_literal: true

require 'test_helper'

class LvsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lv = lvs(:one)
  end

  test 'should get index' do
    get lvs_url
    assert_response :success
  end

  test 'should get new' do
    get new_lv_url
    assert_response :success
  end

  test 'should create lv' do
    assert_difference('Lv.count') do
      post lvs_url,
           params: { lv: { altura: @lv.altura, eemm: @lv.eemm, izaje: @lv.izaje, lototo: @lv.lototo, obervado: @lv.obervado,
                           observador: @lv.observador, proceso: @lv.proceso } }
    end

    assert_redirected_to lv_url(Lv.last)
  end

  test 'should show lv' do
    get lv_url(@lv)
    assert_response :success
  end

  test 'should get edit' do
    get edit_lv_url(@lv)
    assert_response :success
  end

  test 'should update lv' do
    patch lv_url(@lv),
          params: { lv: { altura: @lv.altura, eemm: @lv.eemm, izaje: @lv.izaje, lototo: @lv.lototo, obervado: @lv.obervado,
                          observador: @lv.observador, proceso: @lv.proceso } }
    assert_redirected_to lv_url(@lv)
  end

  test 'should destroy lv' do
    assert_difference('Lv.count', -1) do
      delete lv_url(@lv)
    end

    assert_redirected_to lvs_url
  end
end
