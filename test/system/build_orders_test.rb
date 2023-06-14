require "application_system_test_case"

class BuildOrdersTest < ApplicationSystemTestCase
  setup do
    @build_order = build_orders(:one)
  end

  test "visiting the index" do
    visit build_orders_url
    assert_selector "h1", text: "Build orders"
  end

  test "should create build order" do
    visit build_orders_url
    click_on "New build order"

    fill_in "Faction", with: @build_order.faction
    fill_in "Name", with: @build_order.name
    fill_in "Notes", with: @build_order.notes
    fill_in "User", with: @build_order.user_id
    click_on "Create Build order"

    assert_text "Build order was successfully created"
    click_on "Back"
  end

  test "should update Build order" do
    visit build_order_url(@build_order)
    click_on "Edit this build order", match: :first

    fill_in "Faction", with: @build_order.faction
    fill_in "Name", with: @build_order.name
    fill_in "Notes", with: @build_order.notes
    fill_in "User", with: @build_order.user_id
    click_on "Update Build order"

    assert_text "Build order was successfully updated"
    click_on "Back"
  end

  test "should destroy Build order" do
    visit build_order_url(@build_order)
    click_on "Destroy this build order", match: :first

    assert_text "Build order was successfully destroyed"
  end
end
