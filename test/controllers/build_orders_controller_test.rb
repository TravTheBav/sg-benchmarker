require "test_helper"

class BuildOrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @build_order = build_orders(:one)
  end

  test "should get index" do
    get build_orders_url
    assert_response :success
  end

  test "should get new" do
    get new_build_order_url
    assert_response :success
  end

  test "should create build_order" do
    assert_difference("BuildOrder.count") do
      post build_orders_url, params: { build_order: { faction: @build_order.faction, name: @build_order.name, notes: @build_order.notes, user_id: @build_order.user_id } }
    end

    assert_redirected_to build_order_url(BuildOrder.last)
  end

  test "should show build_order" do
    get build_order_url(@build_order)
    assert_response :success
  end

  test "should get edit" do
    get edit_build_order_url(@build_order)
    assert_response :success
  end

  test "should update build_order" do
    patch build_order_url(@build_order), params: { build_order: { faction: @build_order.faction, name: @build_order.name, notes: @build_order.notes, user_id: @build_order.user_id } }
    assert_redirected_to build_order_url(@build_order)
  end

  test "should destroy build_order" do
    assert_difference("BuildOrder.count", -1) do
      delete build_order_url(@build_order)
    end

    assert_redirected_to build_orders_url
  end
end
