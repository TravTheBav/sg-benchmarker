class AddBuildOrderToAttackBenchmarks < ActiveRecord::Migration[7.0]
  def change
    add_column :attack_benchmarks, :build_order, :string
  end
end
