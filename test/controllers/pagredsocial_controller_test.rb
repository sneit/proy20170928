require 'test_helper'

class PagredsocialControllerTest < ActionController::TestCase
  test "should get fotoscanchita" do
    get :fotoscanchita
    assert_response :success
  end

  test "should get caracteristica" do
    get :caracteristica
    assert_response :success
  end

  test "should get integrante" do
    get :integrante
    assert_response :success
  end

  test "should get miembro" do
    get :miembro
    assert_response :success
  end

  test "should get contactenos" do
    get :contactenos
    assert_response :success
  end

end
