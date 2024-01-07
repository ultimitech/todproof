require 'test_helper'

class TranslationsControllerTest < ActionController::TestCase
  setup do
    # @translation = translations(:one)
    @message = Message.create(dod: '1957-01-13', tod: 'x', dow: 'su', title: 'New Wine')
    @translation = Translation.create(lan: 'AFR', tran_title: 'Nagmaal', descrip: 'Unabridged', blkc: 12, parc: 24, senc: 240, xcrip: 'A', message: @message)
    @user = User.create(username: 'abcxyz', email: 'john@example.com', password: 'password', admin: true)    
  end

  test "should get index" do
    session[:user_id] = @user.id
    get :index
    assert_response :success
    # assert_not_nil assigns(:translations)
  end

  test "should get new" do
    session[:user_id] = @user.id
    get :new
    assert_response :success
  end

  # test "should create translation" do
  #   assert_difference('Translation.count') do
  #     post :create, translation: { blkc: @translation.blkc, descrip: @translation.descrip, lan: @translation.lan, message_id: @translation.message_id, parc: @translation.parc, senc: @translation.senc, tran_title: @translation.tran_title, xcrip: @translation.xcrip }
  #   end

  #   assert_redirected_to translation_path(assigns(:translation))
  # end

  test "should show translation" do
    session[:user_id] = @user.id
    get :show, id: @translation
    assert_response :success
  end

  # test "should get edit" do
  #   get :edit, id: @translation
  #   assert_response :success
  # end

  # test "should update translation" do
  #   patch :update, id: @translation, translation: { blkc: @translation.blkc, descrip: @translation.descrip, lan: @translation.lan, message_id: @translation.message_id, parc: @translation.parc, senc: @translation.senc, tran_title: @translation.tran_title, xcrip: @translation.xcrip }
  #   assert_redirected_to translation_path(assigns(:translation))
  # end

  # test "should destroy translation" do
  #   assert_difference('Translation.count', -1) do
  #     delete :destroy, id: @translation
  #   end

  #   assert_redirected_to translations_path
  # end

  test 'should redirect create when admin not logged in' do
    assert_no_difference 'Translation.count' do
      post :create, translation: { lan: 'AFR', tran_title: 'Nagmaal', descrip: 'Unabridged', blkc: 12, parc: 24, senc: 240, xcrip: 'A', message_id: 1, message: @message }
    end
    assert_redirected_to root_path
  end

end
