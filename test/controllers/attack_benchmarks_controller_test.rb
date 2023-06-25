require "test_helper"

class AttackBenchmarksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @attack_benchmark = attack_benchmarks(:one)
  end

  test "should get index" do
    get attack_benchmarks_url
    assert_response :success
  end

  test "should get new" do
    get new_attack_benchmark_url
    assert_response :success
  end

  test "should create attack_benchmark" do
    assert_difference("AttackBenchmark.count") do
      post attack_benchmarks_url, params: { attack_benchmark: { build_order_id: @attack_benchmark.build_order_id, map: @attack_benchmark.map, notes: @attack_benchmark.notes, time: @attack_benchmark.time, user_id: @attack_benchmark.user_id } }
    end

    assert_redirected_to attack_benchmark_url(AttackBenchmark.last)
  end

  test "should show attack_benchmark" do
    get attack_benchmark_url(@attack_benchmark)
    assert_response :success
  end

  test "should get edit" do
    get edit_attack_benchmark_url(@attack_benchmark)
    assert_response :success
  end

  test "should update attack_benchmark" do
    patch attack_benchmark_url(@attack_benchmark), params: { attack_benchmark: { build_order_id: @attack_benchmark.build_order_id, map: @attack_benchmark.map, notes: @attack_benchmark.notes, time: @attack_benchmark.time, user_id: @attack_benchmark.user_id } }
    assert_redirected_to attack_benchmark_url(@attack_benchmark)
  end

  test "should destroy attack_benchmark" do
    assert_difference("AttackBenchmark.count", -1) do
      delete attack_benchmark_url(@attack_benchmark)
    end

    assert_redirected_to attack_benchmarks_url
  end
end
