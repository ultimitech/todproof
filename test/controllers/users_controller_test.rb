require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    # @user = users(:one)
    @user2 = User.create(username: 'pqrstu', email: 'pqr@example.com', password: 'pwd', admin: false)
    @user = User.create(username: 'abcxyz', email: 'john@example.com', password: 'password', admin: true)    
  end

  test "should get index" do
    session[:user_id] = @user.id
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    session[:user_id] = @user.id
    get :new
    assert_response :success
  end

  # test "should create user" do
  #   assert_difference('User.count') do
  #     post :create, user: { email: @user.email, username: @user.username }
  #   end

  #   assert_redirected_to user_path(assigns(:user))
  # end

  test "should show user" do
    session[:user_id] = @user.id
    get :show, id: @user
    assert_response :success
  end

  # test "should get edit" do
  #   get :edit, id: @user
  #   assert_response :success
  # end

  # test "should update user" do
  #   patch :update, id: @user, user: { email: @user.email, username: @user.username }
  #   assert_redirected_to user_path(assigns(:user))
  # end

  # test "should destroy user" do
  #   assert_difference('User.count', -1) do
  #     delete :destroy, id: @user
  #   end

  #   assert_redirected_to users_path
  # end

  test 'should redirect create when admin not logged in' do
    assert_no_difference 'User.count' do
      post :create, user: { username: 'pqrstu', email: 'pqr@example.com', password: 'pwd', admin: false }
    end
    assert_redirected_to root_path
  end

end
