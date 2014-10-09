require 'test_helper'

class MessagesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get conversation" do
    get :conversation
    assert_response :success
  end

  test "should get reply_message" do
    get :reply_message
    assert_response :success
  end

  test "should get sent_messages" do
    get :sent_messages
    assert_response :success
  end

end
