# frozen_string_literal: true

require 'test_helper'

class MmppsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mmpp = mmpps(:one)
  end

  test 'should get index' do
    get mmpps_url
    assert_response :success
  end

  test 'should get new' do
    get new_mmpp_url
    assert_response :success
  end

  test 'should create mmpp' do
    assert_difference('Mmpp.count') do
      post mmpps_url,
           params: { mmpp: { densidad: @mmpp.densidad, descripcion: @mmpp.descripcion, nombre: @mmpp.nombre } }
    end

    assert_redirected_to mmpp_url(Mmpp.last)
  end

  test 'should show mmpp' do
    get mmpp_url(@mmpp)
    assert_response :success
  end

  test 'should get edit' do
    get edit_mmpp_url(@mmpp)
    assert_response :success
  end

  test 'should update mmpp' do
    patch mmpp_url(@mmpp),
          params: { mmpp: { densidad: @mmpp.densidad, descripcion: @mmpp.descripcion, nombre: @mmpp.nombre } }
    assert_redirected_to mmpp_url(@mmpp)
  end

  test 'should destroy mmpp' do
    assert_difference('Mmpp.count', -1) do
      delete mmpp_url(@mmpp)
    end

    assert_redirected_to mmpps_url
  end
end
