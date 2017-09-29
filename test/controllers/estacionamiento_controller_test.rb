require 'test_helper'

class EstacionamientoControllerTest < ActionController::TestCase
  test "should get nuevo_est" do
    get :nuevo_est
    assert_response :success
  end

  test "should get buscar_est" do
    get :buscar_est
    assert_response :success
  end

end
