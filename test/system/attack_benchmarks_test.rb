require "application_system_test_case"

class AttackBenchmarksTest < ApplicationSystemTestCase
  setup do
    @attack_benchmark = attack_benchmarks(:one)
  end

  test "visiting the index" do
    visit attack_benchmarks_url
    assert_selector "h1", text: "Attack benchmarks"
  end

  test "should create attack benchmark" do
    visit attack_benchmarks_url
    click_on "New attack benchmark"

    fill_in "Build order", with: @attack_benchmark.build_order_id
    fill_in "Map", with: @attack_benchmark.map
    fill_in "Notes", with: @attack_benchmark.notes
    fill_in "Time", with: @attack_benchmark.time
    fill_in "User", with: @attack_benchmark.user_id
    click_on "Create Attack benchmark"

    assert_text "Attack benchmark was successfully created"
    click_on "Back"
  end

  test "should update Attack benchmark" do
    visit attack_benchmark_url(@attack_benchmark)
    click_on "Edit this attack benchmark", match: :first

    fill_in "Build order", with: @attack_benchmark.build_order_id
    fill_in "Map", with: @attack_benchmark.map
    fill_in "Notes", with: @attack_benchmark.notes
    fill_in "Time", with: @attack_benchmark.time
    fill_in "User", with: @attack_benchmark.user_id
    click_on "Update Attack benchmark"

    assert_text "Attack benchmark was successfully updated"
    click_on "Back"
  end

  test "should destroy Attack benchmark" do
    visit attack_benchmark_url(@attack_benchmark)
    click_on "Destroy this attack benchmark", match: :first

    assert_text "Attack benchmark was successfully destroyed"
  end
end
