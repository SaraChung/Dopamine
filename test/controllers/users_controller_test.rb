require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get profile" do
    get :profile
    assert_response :success
  end

  test "should get matches" do
    get :matches
    assert_response :success
  end

  test "should get add_match" do
    get :add_match
    assert_response :success
  end

  test "should get destroy" do
    get :destroy
    assert_response :success
  end

end
