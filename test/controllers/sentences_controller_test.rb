require 'test_helper'

class SentencesControllerTest < ActionController::TestCase
  setup do
    # @sentence = sentences(:one)
    @message = Message.create(dod: '1957-01-13', tod: 'x', dow: 'su', title: 'New Wine')
    @translation = Translation.create(lan: 'AFR', tran_title: 'Nagmaal', descrip: 'Unabridged', blkc: 12, parc: 24, senc: 240, xcrip: 'A', message: @message)
    @sentence = Sentence.create(blk: 56, par: 123, sen: 3, typ: 'n', translation: @translation)
    @user = User.create(username: 'abcxyz', email: 'john@example.com', password: 'password', admin: true)    
  end

  test "should get index" do
    session[:user_id] = @user.id
    get :index
    assert_response :success
    # assert_not_nil assigns(:sentences)
  end

  test "should get new" do
    session[:user_id] = @user.id
    get :new
    assert_response :success
  end

  # test "should create sentence" do
  #   assert_difference('Sentence.count') do
  #     post :create, sentence: { blk: @sentence.blk, par: @sentence.par, sen: @sentence.sen, tie: @sentence.tie, translation_id: @sentence.translation_id, typ: @sentence.typ }
  #   end

  #   assert_redirected_to sentence_path(assigns(:sentence))
  # end

  test "should show sentence" do
    session[:user_id] = @user.id
    get :show, id: @sentence
    assert_response :success
  end

  # test "should get edit" do
  #   get :edit, id: @sentence
  #   assert_response :success
  # end

  # test "should update sentence" do
  #   patch :update, id: @sentence, sentence: { blk: @sentence.blk, par: @sentence.par, sen: @sentence.sen, tie: @sentence.tie, translation_id: @sentence.translation_id, typ: @sentence.typ }
  #   assert_redirected_to sentence_path(assigns(:sentence))
  # end

  # test "should destroy sentence" do
  #   assert_difference('Sentence.count', -1) do
  #     delete :destroy, id: @sentence
  #   end

  #   assert_redirected_to sentences_path
  # end

  test 'should redirect create when admin not logged in' do
    assert_no_difference 'Sentence.count' do
      post :create, sentence: {blk: 56, par: 123, sen: 3, typ: 'n', translation: @translation}
    end
    assert_redirected_to root_path
  end

end
