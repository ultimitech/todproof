require 'test_helper'

class ExportTextConfigsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get success" do
    get :success
    assert_response :success
  end

end
