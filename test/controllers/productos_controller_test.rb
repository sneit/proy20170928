require 'test_helper'

class ProductosControllerTest < ActionController::TestCase
  test "should get nuevo" do
    get :nuevo
    assert_response :success
  end

  test "should get buscar" do
    get :buscar
    assert_response :success
  end

end
