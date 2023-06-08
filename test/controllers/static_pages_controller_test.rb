require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "should get landing" do
    get landing_url
    assert_response :success
    assert_select "title", "SgBenchmarker | Welcome"
  end

  test "should change navbar log in link to log out link when user logs in" do
    sign_in users(:travis)
    get landing_url
    assert_select "a[href=?]", destroy_user_session_path, count: 1
  end

  test "should change navbar log out link to log in link when user logs out" do
    sign_in users(:travis)
    sign_out users(:travis)
    get landing_url
    assert_select "a[href=?]", destroy_user_session_path, count: 0
  end

  test "should get about" do
    get about_url
    assert_response :success
    assert_select "title", "SgBenchmarker | About"
  end
end
