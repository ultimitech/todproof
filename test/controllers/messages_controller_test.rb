require 'test_helper'

class MessagesControllerTest < ActionController::TestCase
  setup do
    # @message = messages(:one)
    @message = Message.create(dod: '1957-01-13', tod: 'x', dow: 'su', title: 'New Wine')
    @user = User.create(username: 'abcxyz', email: 'john@example.com', password: 'password', admin: true)    
  end

  test "should get index" do
    session[:user_id] = @user.id
    get :index
    assert_response :success
    # assert_not_nil assigns(:messages)
  end

  test "should get new" do
    session[:user_id] = @user.id
    get :new
    assert_response :success
  end

  # test "should create message" do
  #   assert_difference('Message.count') do
  #     post :create, message: { dod: @message.dod, dow: @message.dow, title: @message.title, tod: @message.tod }
  #   end

  #   assert_redirected_to message_path(assigns(:message))
  # end

  test "should show message" do
    session[:user_id] = @user.id
    get :show, id: @message
    assert_response :success
  end

  # test "should get edit" do
  #   get :edit, id: @message
  #   assert_response :success
  # end

  # test "should update message" do
  #   patch :update, id: @message, message: { dod: @message.dod, dow: @message.dow, title: @message.title, tod: @message.tod }
  #   assert_redirected_to message_path(assigns(:message))
  # end

  # test "should destroy message" do
  #   assert_difference('Message.count', -1) do
  #     delete :destroy, id: @message
  #   end

  #   assert_redirected_to messages_path
  # end

  test 'should redirect create when admin not logged in' do
    assert_no_difference 'Message.count' do
      post :create, message: { dod: '1957-01-13', tod: 'x', dow: 'su', title: 'New Wine' }
    end
    assert_redirected_to root_path
  end

end
