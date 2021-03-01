# frozen_string_literal: true

require 'test_helper'

class CuasisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cuasi = cuasis(:one)
  end

  test 'should get index' do
    get cuasis_url
    assert_response :success
  end

  test 'should get new' do
    get new_cuasi_url
    assert_response :success
  end

  test 'should create cuasi' do
    assert_difference('Cuasi.count') do
      post cuasis_url,
           params: { cuasi: { accion: @cuasi.accion, estado: @cuasi.estado, fecha: @cuasi.fecha, potencial: @cuasi.potencial,
                              reporta: @cuasi.reporta, responsable: @cuasi.responsable, sitio: @cuasi.sitio } }
    end

    assert_redirected_to cuasi_url(Cuasi.last)
  end

  test 'should show cuasi' do
    get cuasi_url(@cuasi)
    assert_response :success
  end

  test 'should get edit' do
    get edit_cuasi_url(@cuasi)
    assert_response :success
  end

  test 'should update cuasi' do
    patch cuasi_url(@cuasi),
          params: { cuasi: { accion: @cuasi.accion, estado: @cuasi.estado, fecha: @cuasi.fecha, potencial: @cuasi.potencial,
                             reporta: @cuasi.reporta, responsable: @cuasi.responsable, sitio: @cuasi.sitio } }
    assert_redirected_to cuasi_url(@cuasi)
  end

  test 'should destroy cuasi' do
    assert_difference('Cuasi.count', -1) do
      delete cuasi_url(@cuasi)
    end

    assert_redirected_to cuasis_url
  end
end
