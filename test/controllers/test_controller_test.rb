require 'test_helper'

class TestControllerTest < ActionController::TestCase
  test "should get tab1" do
    get :tab1
    assert_response :success
  end

  test "should get tab2" do
    get :tab2
    assert_response :success
  end

  test "should get tab3" do
    get :tab3
    assert_response :success
  end

  test "should get tab4" do
    get :tab4
    assert_response :success
  end

  test "should get tab5" do
    get :tab5
    assert_response :success
  end

end
