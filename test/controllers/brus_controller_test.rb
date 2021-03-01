# frozen_string_literal: true

require 'test_helper'

class BrusControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bru = brus(:one)
  end

  test 'should get index' do
    get brus_url
    assert_response :success
  end

  test 'should get new' do
    get new_bru_url
    assert_response :success
  end

  test 'should create bru' do
    assert_difference('Bru.count') do
      post brus_url,
           params: { bru: { comentarios: @bru.comentarios, fecha: @bru.fecha, ingreso: @bru.ingreso, mmpp: @bru.mmpp,
                            numero: @bru.numero, patente: @bru.patente, salida: @bru.salida } }
    end

    assert_redirected_to bru_url(Bru.last)
  end

  test 'should show bru' do
    get bru_url(@bru)
    assert_response :success
  end

  test 'should get edit' do
    get edit_bru_url(@bru)
    assert_response :success
  end

  test 'should update bru' do
    patch bru_url(@bru),
          params: { bru: { comentarios: @bru.comentarios, fecha: @bru.fecha, ingreso: @bru.ingreso, mmpp: @bru.mmpp,
                           numero: @bru.numero, patente: @bru.patente, salida: @bru.salida } }
    assert_redirected_to bru_url(@bru)
  end

  test 'should destroy bru' do
    assert_difference('Bru.count', -1) do
      delete bru_url(@bru)
    end

    assert_redirected_to brus_url
  end
end
