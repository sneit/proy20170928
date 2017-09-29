require 'test_helper'

class DashboardControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get persona" do
    get :persona
    assert_response :success
  end

  test "should get local" do
    get :local
    assert_response :success
  end

  test "should get canchita" do
    get :canchita
    assert_response :success
  end

  test "should get alquiler" do
    get :alquiler
    assert_response :success
  end

  test "should get servicioadicional" do
    get :servicioadicional
    assert_response :success
  end

  test "should get listaalquiler" do
    get :listaalquiler
    assert_response :success
  end

  test "should get publicidad" do
    get :publicidad
    assert_response :success
  end

  test "should get acceso" do
    get :acceso
    assert_response :success
  end

end
