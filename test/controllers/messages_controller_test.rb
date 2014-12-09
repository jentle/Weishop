require 'test_helper'

class MessagesControllerTest < ActionController::TestCase
  setup do
    @message = messages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:messages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create message" do
    assert_difference('Message.count') do
      post :create, message: { content: @message.content, create_time: @message.create_time, format: @message.format, media_id: @message.media_id, msg_id: @message.msg_id, msg_type: @message.msg_type, pic_url: @message.pic_url, thumb_media_id: @message.thumb_media_id, to_user_name: @message.to_user_name }
    end

    assert_redirected_to message_path(assigns(:message))
  end

  test "should show message" do
    get :show, id: @message
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @message
    assert_response :success
  end

  test "should update message" do
    patch :update, id: @message, message: { content: @message.content, create_time: @message.create_time, format: @message.format, media_id: @message.media_id, msg_id: @message.msg_id, msg_type: @message.msg_type, pic_url: @message.pic_url, thumb_media_id: @message.thumb_media_id, to_user_name: @message.to_user_name }
    assert_redirected_to message_path(assigns(:message))
  end

  test "should destroy message" do
    assert_difference('Message.count', -1) do
      delete :destroy, id: @message
    end

    assert_redirected_to messages_path
  end
end
