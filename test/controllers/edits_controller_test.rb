require 'test_helper'

class EditsControllerTest < ActionController::TestCase
  setup do
    # @edit = edits(:one)
    # @edit = Edit.create(content: 'Goeinaand vriende.', sentence: @sentence)
    @edit = Edit.create(content: 'Goeinaand vriende.')
    @user = User.create(username: 'abcxyz', email: 'john@example.com', password: 'password', admin: true)    
  end

  test "should get index" do
    session[:user_id] = @user.id
    get :index
    assert_response :success
    # assert_not_nil assigns(:edits)
  end

  test "should get new" do
    session[:user_id] = @user.id
    get :new
    assert_response :success
  end

  # test "should create edit" do
  #   assert_difference('Edit.count') do
  #     post :create, edit: { content: @edit.content, hid: @edit.hid }
  #   end

  #   assert_redirected_to edit_path(assigns(:edit))
  # end

  test "should show edit" do
    session[:user_id] = @user.id
    get :show, id: @edit
    assert_response :success
  end

  # test "should get edit" do
  #   get :edit, id: @edit
  #   assert_response :success
  # end

  # test "should update edit" do
  #   patch :update, id: @edit, edit: { content: @edit.content, hid: @edit.hid }
  #   assert_redirected_to edit_path(assigns(:edit))
  # end

  # test "should destroy edit" do
  #   assert_difference('Edit.count', -1) do
  #     delete :destroy, id: @edit
  #   end

  #   assert_redirected_to edits_path
  # end

  test 'should redirect create when admin not logged in' do
    assert_no_difference 'Edit.count' do
      post :create, edit: { content: 'Goeinaand vriende.' }
    end
    assert_redirected_to root_path
  end

end
