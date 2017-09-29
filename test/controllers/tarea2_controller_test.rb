require 'test_helper'

class Tarea2ControllerTest < ActionController::TestCase
  test "should get calcular" do
    get :calcular
    assert_response :success
  end

  test "should get rando" do
    get :rando
    assert_response :success
  end

end
