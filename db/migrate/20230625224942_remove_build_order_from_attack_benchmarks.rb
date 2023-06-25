class RemoveBuildOrderFromAttackBenchmarks < ActiveRecord::Migration[7.0]
  def change
    remove_reference :attack_benchmarks, :build_order, null: false, foreign_key: true
  end
end
