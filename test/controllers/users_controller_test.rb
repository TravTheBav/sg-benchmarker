require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "should get profile when user is signed in" do
    sign_in users(:travis)
    get profile_url
    assert_response :success
  end

  test "should redirect to sign in page when attempting to access profile but 
        not logged in" do
    get profile_url
    assert_redirected_to new_user_session_path
    assert_equal 'Sign in required', flash[:alert]
  end
end
